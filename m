From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 May 2012 08:57:34 +0200
Subject: [Buildroot] [PATCH 1/1] opencv: bump to version 2.4.0
In-Reply-To: <20120515034259.GA3091@sapphire.tkos.co.il> (Baruch Siach's
 message of "Tue, 15 May 2012 06:42:59 +0300")
References: <1337035892-29285-1-git-send-email-s.martin49@gmail.com>
 <20120515034259.GA3091@sapphire.tkos.co.il>
Message-ID: <87aa1avsm9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> +config BR2_PACKAGE_OPENCV_ENABLE_SSSE3
 >> +	bool "enable SSSE3 instructions"
 >> +
 >> +endif # BR2_i386 || BR2_x86_64

 Baruch> Can we detect the SSE capability of the target automatically
 Baruch> using the various BR2_x86_* config options in
 Baruch> target/Config.in.arch?

Yes, see what we do for E.G. libevas.

-- 
Bye, Peter Korsgaard
