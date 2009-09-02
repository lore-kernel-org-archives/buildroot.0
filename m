From: Tim Barr <tbarr@multitech.com>
Date: Wed, 2 Sep 2009 16:07:35 -0500
Subject: [Buildroot] Problem with compile using ARM926T vs. generic_arm
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E61218C13C@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Found the answer in bug 367. Should have searched the web before I
emailed. Sorry.

Tim Barr
Development Engineer

Multi-Tech Systems, Inc.


> -----Original Message-----
> From: buildroot-bounces at busybox.net 
> [mailto:buildroot-bounces at busybox.net] On Behalf Of Tim Barr
> Sent: Wednesday, September 02, 2009 2:47 PM
> To: buildroot at uclibc.org
> Subject: [Buildroot] Problem with compile using ARM926T vs. 
> generic_arm
> 
> 
> I am trying to update my build from buildroot-2009.01 and a 
> 2.6.25 kernel to buildroot-2009.05 and a 2.6.28 kernel. When 
> I try to make the at91sam9g20dfc project, so that I have a 
> baseline configuration to modify for my board design, I get 
> an the following error if the buildroot Target Architecture 
> Variant is set to arm926t:
> 
> Tim Barr 
> Development Engineer 
> Multi-Tech Systems, Inc. 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net 
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
