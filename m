From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jan 2010 10:01:37 +0100
Subject: [Buildroot] uClibc-0.9.30.1 build missing file
In-Reply-To: <1262460863.4626.14.camel@RoadRunner> (Nicolae T.'s message of
	"Sat, 02 Jan 2010 11:34:23 -0800")
References: <1262460863.4626.14.camel@RoadRunner>
Message-ID: <87skamnszy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolae" == Nicolae T <microvis@cox.net> writes:

 Nicolae> Hello Peter,
 Nicolae> .config file attached

Thanks. I see that you have disabled sysroot support
(BR2_TOOLCHAIN_SYSROOT). You should normally enable sysroot support
unless you have a strong reason not to. With that enabled it builds
here.

Also notice that you have disabled sw floating point
(BR2_SOFT_FLOAT). This should normally be enabled for fpu-lacking archs
for optimal performance.

-- 
Bye, Peter Korsgaard
