$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "pathname"

ONDEMAND=Pathname.new("ondemand.osc.edu")
AWESIM=Pathname.new("apps.awesim.org")
DEMO=Pathname.new("ood.osc.edu")
DEMO_TEST=Pathname.new("ood-test.osc.edu")

require "minitest/autorun"
