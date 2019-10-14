From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 21:45:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/pango: bump to version 1.44.6
In-Reply-To: <20191014174759.96598-1-james.hilliard1@gmail.com>
References: <20191014174759.96598-1-james.hilliard1@gmail.com>
Message-ID: <20191014214510.069a0e7e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 11:47:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Switch build system from autotools to meson.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...01-build-disable-tests-from-building.patch | 41 -------------------
>  ...rtion-with-invalid-Unicode-sequences.patch | 38 -----------------
>  package/pango/0002-no-gtk-doc.patch           | 25 -----------
>  package/pango/pango.hash                      |  4 +-
>  package/pango/pango.mk                        | 17 +++-----
>  5 files changed, 8 insertions(+), 117 deletions(-)
>  delete mode 100644 package/pango/0001-build-disable-tests-from-building.patch
>  delete mode 100644 package/pango/0002-Prevent-an-assertion-with-invalid-Unicode-sequences.patch
>  delete mode 100644 package/pango/0002-no-gtk-doc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
