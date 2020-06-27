From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 16:49:06 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2020.80
In-Reply-To: <20200627045016.335661-1-francois.perrad@gadz.org>
References: <20200627045016.335661-1-francois.perrad@gadz.org>
Message-ID: <20200627164906.4f48ad8f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 27 Jun 2020 06:50:16 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> remove merged patches.
> 
> LICENSE diff:
> - Copyright (c) 2002-2015 Matt Johnston
> + Copyright (c) 2002-2020 Matt Johnston
> - LibTomCrypt and LibTomMath are written by Tom St Denis, and are Public Domain.
> + LibTomCrypt and LibTomMath are written by Tom St Denis and others, see
> + libtomcrypt/LICENSE and libtommath/LICENSE.
> 
> and now, handles legal-info when LibTomMath & LibTomCrypt and bundled.

Thanks! Could you split the license information fix (for the "small"
configuration) from the version bump in two separate patches ? Indeed
the license information fix is really a fix that already applies to the
currently packaged Dropbear version, and we will want to backport this
to our LTS version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
