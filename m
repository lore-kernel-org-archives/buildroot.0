From: Tim Barr <tbarr@multitech.com>
Date: Fri, 21 Mar 2008 16:26:10 -0500
Subject: [Buildroot] Problem with buildroot and AT91SAM9260EK
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60ACA766E@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did a dirclean to basically start with a baseline make. When I do a
"make menuconfig" and select arm architecture, then go to: 
                   target options--> Atmel Device Support--> Board
Support for Atmel
and set the AT91 device to a AT91SAM9260, for the development board
support selections I get the choice of AT91SAM9260DFC, AT91SAM9260EK, or
AT91SAM9XE-EK. But in the target/device/atmel directory there is only a
at91sam9260dfc and at91sam9260pf directory. So if I pick the
at91sam9260ek I get an error when try to a "make configured" because it
is looking for files in a nonexistent directory. So my first question is
whether there is supposed to be an at91sam9260ek directory? Or is the
at91sam9260dfc the proper one to use even if you are using the board
mounted DataFlash device?
 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080321/f9570526/attachment.htm 
