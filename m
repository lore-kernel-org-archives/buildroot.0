From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:22:31 +0200
Subject: [Buildroot] [PATCH 000/100] Rework of the gettext handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704192231.2ca7f213@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 16:47:40 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (100):
>   libglib2: disable compiler warnings
>   flex: remove bogus comment
>   lvm2: force disable NLS support
>   ushare: do not use the DISABLE_NLS variable
>   uclibc: enable libintl stubs
>   toolchain: introduce BR2_TOOLCHAIN_HAS_FULL_GETTEXT
>   gettext: force build libintl if needed
>   package: rename DISABLE_NLS to NLS_OPTS
>   system: introduce BR2_SYSTEM_ENABLE_NLS
>   package/Makefile.in: introduce TARGET_NLS_{DEPENDENCIES,LIBS}
>   package/Makefile.in: fix musl handling

I've applied those 11 initial patches, and kicked off a rebuild of the
toolchains, so that all our uClibc toolchains have the stub gettext
implementation. Then I will proceed with applying the remainder of the
series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
