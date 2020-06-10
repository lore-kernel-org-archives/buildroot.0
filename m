From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:35:12 +0200
Subject: [Buildroot] [PATCH v2] package/libcamera: bump version to
 8823461
In-Reply-To: <20200610211811.17118-1-ps.report@gmx.net>
References: <20200610211811.17118-1-ps.report@gmx.net>
Message-ID: <20200610233512.2cf87475@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Jun 2020 23:18:11 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - add host dependencies: openssl, pkgconf, pyhton3-pyyaml
> - add dependencies: boost, gnutls

Nooooo, it really unconditionally needs boost and gnutls? Why so? This
really seems like an odd choice from upstream. Kieran, do you confirm
this is really what you guys are doing?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
