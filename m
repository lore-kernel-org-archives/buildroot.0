From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 21:20:32 +0100
Subject: [Buildroot] [PATCH] package/gcc: remove gcc 5.5 or1k fork
In-Reply-To: <20200102220415.431543-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 2 Jan 2020 23:04:15 +0100")
References: <20200102220415.431543-1-romain.naour@gmail.com>
Message-ID: <87pneuxfxr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Remove the old gcc 5.5 fork for or1k architecture
 > that start to fail to build with recent version
 > of Binutils >= 2.32 with the following error:

 > host-gcc-final-or1k-musl-5.4.0-20170218/build/./gcc/crtbeginS.o: addend should be zero for plt relocations
 > host/or1k-buildroot-linux-uclibc/bin/ld: final link failed: bad value

 > https://gitlab.com/kubu93/buildroot/-/jobs/391938988

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
