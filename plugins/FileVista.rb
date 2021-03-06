##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FileVista" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-07
version "0.1"
description "FileVista is a web file manager for storing, managing and sharing files online through your web browser. - Homepage: http://www.gleamtech.com/products/filevista/web-file-manager"

# Google results as at 2011-05-07 #
# 23 for "Welcome to FileVista" "Please enter your credentials:" "User name"

# Dorks #
dorks [
'"Welcome to FileVista" "Please enter your credentials:" "User name"'
]

# Examples #
examples %w|
www.gleamtech.com/demos/filevista/login.aspx
investorlogin.forbion.com
servicecenter.verykool.net
docs.consigli.com
ca.kuczmarski.com
kikah.com
24.39.104.202
evanterry.imediafiles.com/filevista/
team.grogers.com/login.aspx
filevista.jnt.fi
www.romaricerche.it/filevista/
|

# Matches #
matches [

# Version Detection # HTML comment
{ :version=>/<!--\r?\n\tFileVista v([\d\.]+)\r?\n\tCopyright / },

# Welcome to FileVista text
{ :text=>"<td>Welcome to FileVista<br />Please enter your credentials:</td>" },

]

end


