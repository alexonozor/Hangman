#### This file will launch the app ####
APP_ROOT = File.dirname(__FILE__)
$:.unshift(File.join(APP_ROOT, 'lib'))
require_relative "lib/hangmangame/guide"
guide = Guide.new
guide
