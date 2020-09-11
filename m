From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:33:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/strace: disable mpers support
In-Reply-To: <20200907202410.12228-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Mon, 7 Sep 2020 22:24:10 +0200")
References: <20200907202410.12228-1-heiko.thiery@gmail.com>
Message-ID: <87h7s4vw04.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > On aarch64 With the config option "--enable-mpers=check" the configure.ac
 > script searchs for a 32bit compiler. When a matching compiler is found
 > in the PATH some compatiblity checks are done. This can fail when the
 > available kernel headers on host and buildroot target does not match.

 > Since buildroot does not support 32bit binaries when building for 64bit
 > architecture (no -m32 option) we can disable this option unconditionally.

 > When disabling unconditionally also the configuration for toolchain using
 > MUSL can be removed.

 > Cc: Baruch Siach <baruch@tkos.co.il>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Brandon Maier <brandon.maier@rockwellcollins.com>
 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
