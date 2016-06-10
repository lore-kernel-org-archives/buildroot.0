From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 11:36:15 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/freeswitch: enable video
 support
In-Reply-To: <1465534757-13884-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465534757-13884-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160610113615.3af7b300@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 06:59:17 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8)$(BR2_PACKAGE_FFMPEG),yy)
> +FREESWITCH_LICENSE := $(FREESWITCH_LICENSE) BSD-3c (libvpx, libyuv)

                                             ^^^^ missing comma here

I've added it, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
