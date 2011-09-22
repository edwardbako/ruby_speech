require 'spec_helper'

module RubySpeech
  module GRXML
    describe Tag do
      its(:name) { should == 'tag' }

      it 'registers itself' do
        Element.class_from_registration(:tag).should == Tag
      end

      describe "from a document" do
        let(:document) { '<tag>hello</tag>' }

        subject { Element.import parse_xml(document).root }

        it { should be_instance_of Tag }

        its(:content) { should == 'hello' }
      end

      describe "comparing objects" do
        it "should be equal if the content is the same" do
          Tag.new(:content => "hello").should == Tag.new(:content => "hello")
        end

        describe "when the content is different" do
          it "should not be equal" do
            Tag.new(:content => "Hello").should_not == Tag.new(:content => "Hello there")
          end
        end
      end

      describe "<<" do
        it "should accept String" do
          lambda { subject << 'anything' }.should_not raise_error
        end
      end
    end # Tag
  end # GRXML
end # RubySpeech
