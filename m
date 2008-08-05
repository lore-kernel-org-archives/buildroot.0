From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Aug 2008 07:53:16 +0200
Subject: [Buildroot] Every time I svn buildroot something else stops
	working
In-Reply-To: <1CD05B980C94AC408B37C82BBABAA3E60CECCC37@mtsexchange.dc.multitech.prv>
	(Tim Barr's message of "Tue\, 22 Jul 2008 09\:52\:03 -0500")
References: <1CD05B980C94AC408B37C82BBABAA3E60CECCC37@mtsexchange.dc.multitech.prv>
Message-ID: <87r6946m9f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tim" == Tim Barr <tbarr@multitech.com> writes:

 Tim> After doing a "svn up", I now get an error on uclibc. It tries
 Tim> to apply a reverse patch and fails. I have done a "make clean"
 Tim> and "make dirclean" but still get this error. What should I do
 Tim> now? Delete the uclibc directory and have it rebuild from
 Tim> scratch?
 
Try a rm -rf *build_*

-- 
Bye, Peter Korsgaard
