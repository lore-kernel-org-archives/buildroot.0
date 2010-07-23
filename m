From: Ossy <ossy1980@gmx.net>
Date: Fri, 23 Jul 2010 22:18:00 +0200
Subject: [Buildroot] lzof 2.03 fails building with activated configuration
	cache
Message-ID: <4C49F8F8.5070505@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

I was wondering why the ACC Conformance check of te compiler fails for 
lzof and is successful for some others. I switched of the configration 
cache and the lzof package did NOT compile.

Please see my config attached. For reproducing this error, turn on the 
config cache again.

Regards,
Marcus
(target arm5te)
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100723/fb5b1b0d/attachment-0001.ksh>
