Bundler.require

$LOAD_PATH.unshift(__dir__)
$LOAD_PATH.unshift("#{__dir__}/..")

require 'ext/string'
require 'temperature/content'
require 'temperature/content/probes'
require 'temperature/model/probe'
require 'temperature/routes'