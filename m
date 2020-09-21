From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 23:11:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/gqview: drop package
In-Reply-To: <20200920142143.1415754-1-fontaine.fabrice@gmail.com>
References: <20200920142143.1415754-1-fontaine.fabrice@gmail.com>
Message-ID: <20200921231151.24ab9a9d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 16:21:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy                              |  7 +++++
>  package/Config.in                             |  1 -
>  package/gqview/0001-make.patch                | 11 --------
>  .../gqview/0002-fix-build-with-gcc-10.patch   | 27 -------------------
>  package/gqview/Config.in                      |  7 -----
>  package/gqview/gqview.hash                    |  3 ---
>  package/gqview/gqview.mk                      | 14 ----------
>  7 files changed, 7 insertions(+), 63 deletions(-)
>  delete mode 100644 package/gqview/0001-make.patch
>  delete mode 100644 package/gqview/0002-fix-build-with-gcc-10.patch
>  delete mode 100644 package/gqview/Config.in
>  delete mode 100644 package/gqview/gqview.hash
>  delete mode 100644 package/gqview/gqview.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
