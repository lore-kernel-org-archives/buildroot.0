From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 22:27:02 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/avahi: bump to version 0.8
In-Reply-To: <20200220091526.232214-1-joerg.krause@embedded.rocks>
References: <20200220091526.232214-1-joerg.krause@embedded.rocks>
Message-ID: <20200223222702.57d081b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Feb 2020 10:15:26 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> This bump also includes:
>  * Drop upstream security patch which is included in the new version
>  * Unconditionally disable support for Qt5 [1] (same as Qt3 and Qt4)
>  * Drop dependency on host-inttool, as avahi switched to host-gettext [2]
>  * Conditionally enable support for libevent [3]
>  * Drop disabling support for Qt3, Qt4, and GTK, which are disabled by
>    default now

I've left the explicit disabling of qt4, qt4 and gtk support, and
applied to next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
