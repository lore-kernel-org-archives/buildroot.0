From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 May 2012 09:41:14 +0200
Subject: [Buildroot] [PATCH] Added package fbterm: a framebuffer-based
	terminal emulator.
In-Reply-To: <20120516090940.0a59337b@skate> (Thomas Petazzoni's message of
 "Wed, 16 May 2012 09:09:40 +0200")
References: <1337135766-26862-1-git-send-email-golubovsky@gmail.com>
 <20120516090940.0a59337b@skate>
Message-ID: <87aa18r2sl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Tue, 15 May 2012 22:36:06 -0400,
 Thomas> Dmitry <golubovsky@gmail.com> a ?crit :

 >> +	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && \
 >> +			BR2_TOOLCHAIN_BUILDROOT_CXX && BR2_USE_WCHAR)

 Thomas> You should replace BR2_TOOLCHAIN_BUILDROOT_CXX by BR2_INSTALL_LIBSTDCPP
 Thomas> (yes, I know the name of this config option is crappy), otherwise
 Thomas> users of external toolchains or ct-ng toolchains will not be able to
 Thomas> select this package.

I fixed that while committing.

-- 
Bye, Peter Korsgaard
