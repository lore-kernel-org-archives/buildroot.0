From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Sep 2009 23:25:37 +0200
Subject: [Buildroot] coreutils build failing
In-Reply-To: <4AA5529F.7050906@rodgers.sdcoxmail.com> (Stephen Rodgers's
	message of "Mon\, 07 Sep 2009 11\:36\:15 -0700")
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>
	<877hwbmi5k.fsf@macbook.be.48ers.dk>
	<4AA5300B.3060804@rodgers.sdcoxmail.com>
	<87r5ui63d1.fsf@macbook.be.48ers.dk>
	<4AA5529F.7050906@rodgers.sdcoxmail.com>
Message-ID: <8763bu5twt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:

Hi,

 Stephen> Here's the correct file.

 Stephen> BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 Stephen> BR2_UCLIBC_CONFIG="uClibc.config"

You forgot to send your custom uClibc.config. Coreutils builds here
(Debian) with that config but with the default uclibc config (miniperl
fails through, looking into that now).

Could you either try with the default uclibc config or post your config?

-- 
Bye, Peter Korsgaard
