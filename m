From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Aug 2012 14:44:26 +0200
Subject: [Buildroot] [PATCH v2] barebox: fix license information
In-Reply-To: <1346138387-4344-1-git-send-email-spdawson@gmail.com>
References: <1346138387-4344-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120828144426.483cd251@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Aug 2012 08:19:47 +0100,
spdawson at gmail.com a ?crit :

> +BAREBOX_LICENSE = GPLv2 with exceptions
>  BAREBOX_LICENSE_FILES = COPYING

U-Boot has a similar exception, so shouldn't we be doing the same?

Also, uboot.mk mentions that the license is GPLv2+, but the U-Boot
COPYING file says:

  U-Boot is Free Software.  It is copyrighted by Wolfgang Denk and
many others who contributed code (see the actual source code for
details).  You can redistribute U-Boot and/or modify it under the
terms of version 2 of the GNU General Public License as published by
the Free Software Foundation.  Most of it can also be distributed,
at your option, under any later version of the GNU General Public
License -- see individual files for exceptions.

So I guess that formally speaking U-Boot is GPLv2 only, and not GPLv2+.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
