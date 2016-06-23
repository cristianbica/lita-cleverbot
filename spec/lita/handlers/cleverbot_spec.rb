require "spec_helper"

describe Lita::Handlers::Cleverbot, lita: true, lita_handler: true, additional_lita_handlers: TestHandler do
  let(:room) { Lita::Room.create_or_update("#a", name: "#a") }
  let(:cleverbot) { double }

  context "initializing Cleverbot" do
    it "should initialize the Cleverbot object" do
      expect(Cleverbot).to receive(:new).with("apiuser", "apikey")
      Lita::Handlers::Cleverbot.cleverbot
    end
  end

  context "handling messages" do
    it "shouldn't handle handled messages" do
      expect_any_instance_of(Lita::Handlers::Cleverbot).to receive(:chat).never
      send_message("xtest", from: room)
    end

    it "should try to process an unhandled message" do
      expect_any_instance_of(Lita::Handlers::Cleverbot).to receive(:chat).once
      send_message("test", from: room)
    end
  end

  context "should reply to message" do
    it "shouldn't reply to messages not addressed to the robot" do
      expect_any_instance_of(Lita::Handlers::Cleverbot).to receive(:reply).never
      send_message("test", from: room)
    end

    it "shouldn't reply to messages sent by the bot" do
      expect_any_instance_of(Lita::Handlers::Cleverbot).to receive(:reply).never
      robot_user = Lita::User.new(100, name: robot.mention_name)
      send_message("Lita: test", as: robot_user, from: room)
    end

    it "should try to reply to messages addressed to the robot" do
      expect_any_instance_of(Lita::Handlers::Cleverbot).to receive(:reply).once
      send_message("hey Lita, who am I?", from: room)
    end

    it "should try to reply to command messages #1" do
      expect_any_instance_of(Lita::Handlers::Cleverbot).to receive(:reply).once
      send_message("Lita: who am I?", from: room)
    end

    it "should try to reply to command messages #2" do
      expect_any_instance_of(Lita::Handlers::Cleverbot).to receive(:reply).once
      send_message("@Lita: who am I?", from: room)
    end
  end

  context "replying to messages" do
    before { allow(Lita::Handlers::Cleverbot).to receive(:cleverbot).and_return(cleverbot) }

    it "should strip the robot name from the message #1" do
      expect(cleverbot).to receive(:say).with("who am I?")
      send_message("@Lita: who am I?", from: room)
    end

    it "should strip the robot name from the message #2" do
      expect(cleverbot).to receive(:say).with("who am I?")
      send_message("Lita: who am I?", from: room)
    end

    it "should strip the robot name from the message #3" do
      expect(cleverbot).to receive(:say).with("hey , who am I?")
      send_message("hey Lita, who am I?", from: room)
    end

    it "should reply with the messages from the bot" do
      allow(cleverbot).to receive(:say).with("who am I?").and_return("You")
      send_message("@Lita: who am I?", from: room)
      expect(replies.last).to eq("You")
    end
  end

end
