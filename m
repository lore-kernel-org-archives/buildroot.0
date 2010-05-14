From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 May 2010 11:03:21 +0200
Subject: [Buildroot] package: Add support for pidgin/finch instant
 messenger
In-Reply-To: <201005140300.25098.PeterHuewe@gmx.de>
References: <201005140300.25098.PeterHuewe@gmx.de>
Message-ID: <20100514110321.370b99b9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 May 2010 03:00:24 +0200
Peter Huewe <PeterHuewe@gmx.de> wrote:

> +                $(DISABLE_NLS) \
> +                $(DISABLE_LARGEFILE) \

Not needed.

> +PIDGIN_DEPENDENCIES = uclibc gettext libintl libglib2

You can remove "uclibc" here, it is not needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
