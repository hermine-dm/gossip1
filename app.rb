
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
require 'gossip'
require 'view'
require 'router'

$:.unshift File.expand_path("./../db", __FILE__)
require 'gossip'


Router.new.perform
