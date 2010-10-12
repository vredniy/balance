require 'spec_helper'

describe CashesController do
  render_views 

  describe 'GET at_end as JSON' do
    before :each do
      get :at_end, :format => 'json'
    end

    it { should respond_with(:success) }
    it { should respond_with_content_type(:json) }
    it { assigns(:at_end).should == Cash.at_end }
    it { response.should render_template(:at_end) }
  end

  describe 'GET balance as JSON' do
    before :each do
      get :balance, :format => 'json'
    end

    it { should respond_with(:success) }
    it { should respond_with_content_type(:json) }
    it { assigns(:balance).should == Cash.balance }
    it { response.should render_template(:balance) }
  end

  describe 'with instance' do
    before :each do
      @cash = Factory :cash
    end

    describe 'GET edit as JSON' do
      before :each do
        get :edit, :id => @cash.id, :format => 'json'
      end

      it { should respond_with(:success) }
      it { should respond_with_content_type(:json) }
      it { assigns(:cash).should == @cash }
      it { response.should render_template(:edit) }
    end

    describe 'PUT update as JSON' do
      before :each do
        put :update, :id => @cash.id, :cash => { :name => 'two', :sum => 54.87 }, :format => 'json'
      end

      it { should respond_with(:success) }
      it { should respond_with_content_type(:json) }
      it { assigns(:cash).sum.should == 54.87 }
      it { assigns(:cash).name.should == 'two' }
      it { response.should render_template(:update) }
    end
  end
end