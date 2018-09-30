From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Sep 2018 09:43:22 +0200
Subject: [Buildroot] [PATCH] xlib_libXdmcp: add missing dependency on
 host-pkgconf
References: <20180921121350.22638-1-thomas.petazzoni@bootlin.com>
Message-ID: <qdb68fxonm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 21 Sep 2018 14:13:50 +0200 schrieb Thomas Petazzoni:

> This was detected using per-package target/host folders, because with
> this, only the dependencies explicitly expressed by a package are
> available to the package.

Hi Thomas,

is the current patch series for per-package target/host folders publicly 
available?

Regards, Bernd
