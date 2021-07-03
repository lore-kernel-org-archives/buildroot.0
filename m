From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:13:45 +0200
Subject: [Buildroot] [PATCH 1/5] package/libgpg-error: bump to version
 1.42
In-Reply-To: <20210621054747.218408-1-fontaine.fabrice@gmail.com>
References: <20210621054747.218408-1-fontaine.fabrice@gmail.com>
Message-ID: <20210703231345.7ed2bd59@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 07:47:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (not needed since
> https://dev.gnupg.org/rE1fb90a7da186ee2ee098a666f6f3a35bb1720e59)
> 
> https://dev.gnupg.org/T5194
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-build-Fix-disable-threads.patch      | 39 ++++++++++++++
>  ...nfigure.ac-fix-build-without-threads.patch | 54 -------------------
>  package/libgpg-error/libgpg-error.hash        |  6 +--
>  package/libgpg-error/libgpg-error.mk          |  4 +-
>  4 files changed, 43 insertions(+), 60 deletions(-)
>  create mode 100644 package/libgpg-error/0001-build-Fix-disable-threads.patch
>  delete mode 100644 package/libgpg-error/0001-configure.ac-fix-build-without-threads.patch

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
