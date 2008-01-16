From: Tim Barr <tbarr@multitech.com>
Date: Wed, 16 Jan 2008 09:29:08 -0600
Subject: [Buildroot] How do I build a target-linux-x.x.x.config file?
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E609B6C430@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to use buildroot to create a kernel for my AT91SAM9260EK
board.  The version of buildroot I downloaded is the 1-15-08 snapshot. I
followed the instructions and ran "make menuconfig", saved the default,
then ran "make at91sam9260pf_defconfig" (per the linux4SAM website") to
set up a default configuration for my target. I then ran "make
configured" and defaulted on all the questions. The process gave me the
error that it could not find a at91sam9260pf-linux-2.6.22.10.config
file. There is a at91sam9260pf-linux-2.6.22.1.config file in the target
directory. Are the two versions close enough that I could change the
name of this file and compile successfully? Or do I need to make a
.config file for the 2.6.22.10 version? If so, how do I do that? Thanks!

Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com
