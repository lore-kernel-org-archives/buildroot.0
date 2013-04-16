From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Apr 2013 09:35:40 +0200
Subject: [Buildroot] [PATCH] libserial: new package
In-Reply-To: <1366096804-2032-1-git-send-email-spdawson@gmail.com>
References: <1366096804-2032-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130416093540.5cbdade3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Tue, 16 Apr 2013 08:20:04 +0100, spdawson at gmail.com wrote:

> +LIBSERIAL_VERSION = 0.5.2
> +LIBSERIAL_SITE = http://prdownloads.sourceforge.net/libserial

I think prdownloads.sourceforge.net is just one particular mirror of
Sourceforge, and we now prefer to use http://downloads.sourceforge.net,
which automatically redirects to one available mirror. See all existing
BR packages whose upstream tarball is hosted on Github.

Besides that, your patch is numbered 0000, while the other packages
that we have typically have the patches numbered from 1. This is also
what git format-patch does by default (numbering from 1). We don't have
a strict policy with written rules about this, but the common practice
apparently is to start the patches from 1.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
