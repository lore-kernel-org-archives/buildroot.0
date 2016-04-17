From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:18:17 +0200
Subject: [Buildroot] [PATCH v15 01/27] package/freeswitch: new package
In-Reply-To: <1460906689-29900-2-git-send-email-bernd.kuhls@t-online.de>
References: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
 <1460906689-29900-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160417221817.4cb4eae3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 17:24:23 +0200, Bernd Kuhls wrote:
> +FREESWITCH_VERSION = 1.6.7
> +FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
> +FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
> +FREESWITCH_LICENSE = MPLv1.1, \
> +	GPLv3+ with font exception (fonts), \
> +	Apache-2.0 (apr, apr-util) \

There was a missing comma at the end of this line.

I fixed this before applying.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
