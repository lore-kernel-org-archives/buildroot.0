From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Jun 2019 19:32:22 +0200
Subject: [Buildroot] [PATCH v3 8/9] package/mesa3d: switch build system
 to meson
References: <20190506095451.26522-1-romain.naour@smile.fr>
 <20190506095451.26522-8-romain.naour@smile.fr>
 <7c733dcb-2368-a98d-33c3-6e21ade70a6c@smile.fr>
 <dtbaufxfem.ln2@ID-313208.user.individual.net>
Message-ID: <6ujkufx7dc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 25 Jun 2019 22:14:05 +0200 schrieb Bernd Kuhls:

> Run-time dependency xcb found: NO (tried pkgconfig)
> 
> meson.build:1375:4: ERROR: Dependency "xcb" not found, tried pkgconfig
> 
> Regards, Bernd

Hi,

fixed by v4.

Regards, Bernd
