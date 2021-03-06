##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sony-Projector" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "Sony projecter - Homepage: http://pro.sony.com/bbsc/ssr/cat-projectors/"

# ShodanHQ results as at 2011-08-07 #
# 91 for Network Projector
# 15 for Network Projector "Projector User"

# Examples #
examples %w|
142.58.48.6
146.229.42.160
128.197.198.203
142.58.157.18
142.58.56.7
158.38.47.250
146.229.42.162
168.122.101.60
128.197.198.204
143.50.106.59
168.122.101.61
128.197.198.200
142.58.157.16
128.197.198.199
142.58.157.17
|

# Matches #
matches [

# Landing Page # BODY onLoad
{ :url=>"/", :text=>'<BODY onLoad="setWindowTitle();showIndex();">' },

# Landing Page # form Action="/Forms/index_1"
{ :url=>"/", :text=>'<form Action="/Forms/index_1" method="post"  NAME="form1">' },

# Landing Page # JavaScript src="sonylogoJS.js"
{ :url=>"/", :text=>'<script type="text/javascript" src="sonylogoJS.js"></script>' },

# Frameset # /index_J.htm
{ :url=>"/index_J.htm", :text=>'<frame src="index_bg.htm" NAME="RIGHT" marginwidth="0" marginheight="0" scrolling="no" noresize>' },

# Frameset # /index_E.htm
{ :url=>"/index_E.htm", :text=>'<frame src="index_bg.htm" NAME="RIGHT" marginwidth="0" marginheight="0" scrolling="no" noresize>' },

# JavaScript sonylogo();
{ :text=>'<TR><TD COLSPAN="2"><script type="text/javascript">sonylogo();</script></TD>' },

# Model Detection # /info_data.htm # JavaScript
{ :url=>"/info_data.htm", :model=>/^var info_pj_value = \[[\s]+'([^\s^']+)','[\d]+','[^']{0,256}'\];/ },

# Version Detection # /info_data.htm # JavaScript
{ :url=>"/info_data.htm", :version=>/^var info_other_value = \[[\s]+' ?([^\s^']+)'/ },

]

# Passive #
def passive
	m=[]

	# HTTP Server
	if @headers["server"] =~ /^Network Projector$/
		m << { :certainty=>75, :name=>"Server Header" }
	end

	# WWW-Authenticate Header
	if @headers["www-authenticate"] =~ /Basic realm="Projector (User|Administration)"/
		m << { :certainty=>75, :name=>"WWW-Authenticate Header" }
	end

	# Return passive matches
	m
end
end

