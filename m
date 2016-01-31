From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 08:23:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/knock: bump version
In-Reply-To: <1454196253-15434-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454196253-15434-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131082338.4caf63b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 00:24:13 +0100, Bernd Kuhls wrote:

> -KNOCK_VERSION = 0.7
> -KNOCK_SITE = http://www.zeroflux.org/proj/knock/files
> +KNOCK_VERSION = 258a27e5a47809f97c2b9f2751a88c2f94aae891
> +KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
> +KNOCK_AUTORECONF = YES

What is the motivation for switch from a tarball release to an
apparently random Git commit on the Github repo? This should have been
explained in the commit log.

Thanks :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
