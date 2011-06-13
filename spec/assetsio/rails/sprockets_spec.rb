require 'spec_helper'
require 'sprockets'
require 'assetsio/rails/sprockets'

describe 'SprocketsHelper' do

  let(:account) { 'assetsio-account' }
  let(:sources) { 'http://example.org/asset' }
  let(:options) { {} }
  let(:request) { stub('request', :url => 'http://example.org/') }
  let(:application) { stub('application', :assets => Sprockets::Environment.new) }
  let(:config) { stub('config', :perform_caching => false, :relative_url_root => nil, :asset_host => nil) }
  let(:controller) { stub('controller', :request => request, :config => config) }

  subject {
    c = Struct.new(:config, :controller)
    c.send(:include, ::Sprockets::Helpers::RailsHelper)
    c.new(config, controller)
  }

  before( :each ) do
    Rails.stub(:application => application)
    AssetsIO.account = account
  end

  describe '#javascript_include_tag(*sources)' do
    describe 'method chain' do
      it 'should define #javascript_include_tag_with_assetsio' do
        subject.should respond_to(:javascript_include_tag_with_assetsio)
      end

      it 'should define #javascript_include_tag_without_assetsio' do
        subject.should respond_to(:javascript_include_tag_without_assetsio)
      end
    end

    context 'in Rails production env' do
      before( :each ) do
        Rails.env.stub(:production? => true)
      end

      it 'should modify the sources with AssetsIO.asset_url' do
        AssetsIO.should_receive(:asset_url).with(request, 'js', 'http://example.org/asset').and_return('http://assets.io/id.js')
        subject.should_receive(:javascript_include_tag_without_assetsio).with('http://assets.io/id.js', options)
        subject.javascript_include_tag(sources, options)
      end

      context 'with options' do
        let(:options) { {:recursive => true} }

        it 'should pass given options unaltered' do
          subject.should_receive(:javascript_include_tag_without_assetsio).with(anything(), options)
          subject.javascript_include_tag(sources, options)
        end
      end
    end

    context 'in other Rails envs' do
      before( :each ) do
        Rails.env.stub(:production? => false)
      end

      it 'should pass the sources unaltered' do
        subject.should_receive(:javascript_include_tag_without_assetsio).with(sources)
        subject.javascript_include_tag(sources)
      end
    end
  end

  describe '#stylesheet_link_tag(*sources)' do
    describe 'method chain' do
      it 'should define #stylesheet_link_tag_with_assetsio' do
        subject.should respond_to(:stylesheet_link_tag_with_assetsio)
      end

      it 'should define #stylesheet_link_tag_without_assetsio' do
        subject.should respond_to(:stylesheet_link_tag_without_assetsio)
      end
    end

    context 'in Rails production env' do
      before( :each ) do
        Rails.env.stub(:production? => true)
      end

      it 'should modify the sources with AssetsIO.asset_url' do
        AssetsIO.should_receive(:asset_url).with(request, 'css', 'http://example.org/asset').and_return('http://assets.io/id.css')
        subject.should_receive(:stylesheet_link_tag_without_assetsio).with('http://assets.io/id.css', options)
        subject.stylesheet_link_tag(sources, options)
      end

      context 'with options' do
        let(:options) { {:recursive => true} }

        it 'should pass given options unaltered' do
          subject.should_receive(:stylesheet_link_tag_without_assetsio).with(anything(), options)
          subject.stylesheet_link_tag(sources, options)
        end
      end
    end

    context 'in other Rails envs' do
      before( :each ) do
        Rails.env.stub(:production? => false)
      end

      it 'should pass the sources unaltered' do
        subject.should_receive(:stylesheet_link_tag_without_assetsio).with(sources)
        subject.stylesheet_link_tag(sources)
      end
    end
  end

end
