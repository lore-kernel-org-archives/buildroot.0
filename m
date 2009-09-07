From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Sep 2009 20:01:30 +0200
Subject: [Buildroot] coreutils build failing
In-Reply-To: <4AA5300B.3060804@rodgers.sdcoxmail.com> (Stephen Rodgers's
	message of "Mon\, 07 Sep 2009 09\:08\:43 -0700")
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>
	<877hwbmi5k.fsf@macbook.be.48ers.dk>
	<4AA5300B.3060804@rodgers.sdcoxmail.com>
Message-ID: <87r5ui63d1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:

Hi,

 >> windows.h? That's strange. I just did a build for i686 and that works
 >> without any problems - Please post your .config.
 
 Stephen> The host is i686/Linux/Ubuntu Intrepid

 Stephen> Here's the .config file:

 Stephen> #
 Stephen> # The minimum needed to build a uClibc development system
 Stephen> #
 Stephen> # BR2_PACKAGE_BASH is not set
 Stephen> BR2_PACKAGE_BZIP2=y
 Stephen> # BR2_PACKAGE_COREUTILS is not set

Really?

-- 
Bye, Peter Korsgaard
