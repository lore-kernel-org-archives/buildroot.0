From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 21:35:07 +0200
Subject: [Buildroot] Adding new processors and boards to buildroot
In-Reply-To: <1CD05B980C94AC408B37C82BBABAA3E60D766F2A@mtsexchange.dc.multitech.prv>
	(Tim Barr's message of "Wed\, 27 Aug 2008 11\:25\:22 -0500")
References: <1CD05B980C94AC408B37C82BBABAA3E60D766F2A@mtsexchange.dc.multitech.prv>
Message-ID: <87d4juz1xw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tim" == Tim Barr <tbarr@multitech.com> writes:

Hi,

 Tim> For some reason make 3.81 causes errors trying to compile uboot
 Tim> 1.3.3 which is why they have not moved uboot from 1.2 to 1.3 in
 Tim> buildroot, as I understand it. We saw the same problem, but
 Tim> using make 3.80 instead of make 3.81, we were bale to compile
 Tim> uboot 1.3.3 without errors.

Strange. On what architecture? Does it give the same error if you
compile U-boot by hand? Have you reported it to the U-boot list?

What buildroot are you talking about? Buildroot from uclibc.org (what
this list is about) builds U-Boot 1.3.4 (the latest release).

-- 
Bye, Peter Korsgaard
