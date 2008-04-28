From: p <pmeloy@shaw.ca>
Date: Mon, 28 Apr 2008 11:08:33 -0700
Subject: [Buildroot] cant enable large file support?
In-Reply-To: <6eddb4b495da7293cd085367dc00ab6f@bugs.uclibc.org>
References: <6eddb4b495da7293cd085367dc00ab6f@bugs.uclibc.org>
Message-ID: <1209406113.27297.1.camel@rhodan.rho>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I kept getting errors saying uclib wasn't built with large file support
so I enabled it

# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
# BR2_ENABLE_MULTILIB is not set
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
BR2_INET_RPC=y
BR2_USE_WCHAR=y
# BR2_SOFT_FLOAT is not set
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

I still got the errors so I tried make clean (no good) and even make
distclean.

What other options do I need to turn on in order to compile zlib,
mplayer, et al?
