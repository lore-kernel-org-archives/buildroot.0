From: Tim Barr <tbarr@multitech.com>
Date: Mon, 21 Jan 2008 09:25:03 -0600
Subject: [Buildroot] More newb questions
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E609BFD4EE@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is it possible to used menuconfig to edit a linux config file for an Arm
target?  Or do I have to edit the config file by hand? Whenever I try to
do this, it defaults to an arch/I386/Kconfig and I get a bunch of
non-existent parameters.
 
I still can't figure out why a -rt9 keeps getting appended to the
2.6.22.1 directory name created in the lib/modules directory. My
buildroot keeps failing because there is no 2.6.22.1 directory to put
modules in. Should I not be using a real-time kernel? Or is this some
kind of buildroot bug??
 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080121/1157b0a5/attachment.htm 
