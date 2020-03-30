From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 07:26:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.54.0
In-Reply-To: <20200330000916.97641-1-james.hilliard1@gmail.com>
References: <20200330000916.97641-1-james.hilliard1@gmail.com>
Message-ID: <20200330072613.430fadf0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Mar 2020 18:09:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Remove patches that are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...onfig-add-pkg_config_libdir-property.patch | 102 ------------------
>  ...ction-determine-g-ir-scanner-and-g-i.patch |  62 -----------
>  ...es-gnome.py-Fix-giscanner-and-gicomp.patch |  41 -------
>  package/meson/meson.hash                      |   6 +-
>  package/meson/meson.mk                        |   2 +-
>  5 files changed, 4 insertions(+), 209 deletions(-)
>  delete mode 100644 package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
>  delete mode 100644 package/meson/0004-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
>  delete mode 100644 package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicomp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
