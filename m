From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:40:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdvdread: fix static compile
 by adding libdvdcss as dependency
In-Reply-To: <1466840953-28255-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466840953-28255-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160702154015.55830d5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Jun 2016 09:49:13 +0200, Bernd Kuhls wrote:

> -ifeq ($(BR2_PACKAGE_LIBDVDCSS),y)
>  LIBDVDREAD_CONF_OPTS += --with-libdvdcss
>  LIBDVDREAD_DEPENDENCIES += libdvdcss

I've replaced the += signs with = signs and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
