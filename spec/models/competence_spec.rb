require 'spec_helper'

describe Competence do

	let(:user)	{FactoryGirl.create(:user)}
  before do
    @competence = user.competences.build(titre: "Example", descriptif: "User", diplome: "user@example.com",
                     experience: "foobar", statut_validation: "foobar")
  end

  subject { @competence }
  it { should respond_to(:titre) }
  it { should respond_to(:descriptif) }
  it { should respond_to(:experience) }
  it { should respond_to(:statut_validation) }
  it { should respond_to(:diplome) }

  it {should respond_to(:user)}
  its(:user) {should == user}
  it { should respond_to(:user_id) }


  it { should be_valid }
  

describe "when titre is not present" do
    before do
      @competence = Competence.new(titre: "", descriptif: "User", diplome: "user@example.com",
                     experience: "foobar", statut_validation: "foobar")
    end
    it { should_not be_valid }
  end
end
