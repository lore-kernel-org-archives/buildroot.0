From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 10:06:50 +0200
Subject: [Buildroot] [PATCH v2 2/3] iputils: Update upstream status on
 patches
In-Reply-To: <20190619213008.7883-2-petr.vorel@gmail.com>
References: <20190619213008.7883-1-petr.vorel@gmail.com>
 <20190619213008.7883-2-petr.vorel@gmail.com>
Message-ID: <20190622100650.6de1b05b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Jun 2019 23:30:07 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Patch 0002-meson.build-fix-static-build-with-gcrypt.patch replaced with
> 0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...-ninfod_name.c-fix-build-with-nettle.patch |  4 +-
>  ...atic-build-gcrypt-dependency-gpg-err.patch | 51 ++++++++++++++++
>  ...n.build-fix-static-build-with-gcrypt.patch | 58 -------------------
>  .../0003-meson.build-fix-build-with-NLS.patch | 45 ++++++++------
>  ...uild-sys-Make-setcap-really-optional.patch |  3 +-
>  5 files changed, 80 insertions(+), 81 deletions(-)
>  create mode 100644 package/iputils/0002-build-sys-fix-static-build-gcrypt-dependency-gpg-err.patch
>  delete mode 100644 package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch

Fixed the commit title prefix to be "package/iputils" not just
"iputils". Also, I prefer when the part after the ":" doesn't start
with an upper-case letter. Applied with those minor nits fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
