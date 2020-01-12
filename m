From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:08:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/zeromq: add -latomic to
 libzmq.pc
In-Reply-To: <20200112190748.3717278-1-fontaine.fabrice@gmail.com>
References: <20200112190748.3717278-1-fontaine.fabrice@gmail.com>
Message-ID: <20200112220818.5be6e2a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jan 2020 20:07:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix a static build failure with czmq
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4a12f1ede260cd956a0b5ccb4eec6ca8b44cb04f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch | 36 +++++++++++++++++++
>  package/zeromq/zeromq.mk                      |  2 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/zeromq/0001-acinclude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
