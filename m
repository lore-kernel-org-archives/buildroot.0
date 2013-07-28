From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 17:13:45 +0200
Subject: [Buildroot] [PATCH v3] ser2net: bump to 2.9
In-Reply-To: <1375023755-3329-1-git-send-email-yegorslists@googlemail.com>
References: <1375023755-3329-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20130728171345.4f95ef98@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Sun, 28 Jul 2013 17:02:35 +0200, Yegor Yefremov wrote:

> -SER2NET_VERSION = 2.8
> +SER2NET_VERSION = 2.9
>  SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
> +SER2NET_AUTORECONF = YES
>  SER2NET_LICENSE = GPLv2+
> +
> +# needed due to libtool version mismatch. Check if it was corrected in the
> +# next version.
>  SER2NET_LICENSE_FILES = COPYING

This was wrong, the comment was on the wrong line. Anyway, as noted,
I've committed your v2 and added a comment myself.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
