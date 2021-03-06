require_relative '../spec_helper'

describe User do

  before do
    @user = User.new(prenom: "Example", nom: "User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }
  it { should respond_to(:prenom) }
  it { should respond_to(:nom) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to(:competences)}

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end
  
  describe "when password is not present" do
    before do
      @user = User.new(prenom: "Example", nom: "User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end


  describe "la présences de compétences" do
    before{@user.save}

    it "should destroy all the competences associated whit him" do
      competences = @user.competences
      @user.destroy 
      competences.each do |competence| 
        Competence. find_by_id(competence.id).should be_nil
      end
    end
  end



end
