From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 21:56:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/zlog: bump to version
 ccf8c36e918d6f3c7e6fe9e36eedf8583014c5c9
In-Reply-To: <20190317172840.3511-1-fontaine.fabrice@gmail.com>
References: <20190317172840.3511-1-fontaine.fabrice@gmail.com>
Message-ID: <20190318215611.71f3cb3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 18:28:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patches (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zlog/0001-fix-compiling-on-Buildroot.patch | 32 ------------------
>  ...ove-Werror-and-avoid-build-failures-becau.patch | 38 ----------------------
>  package/zlog/zlog.hash                             |  3 +-
>  package/zlog/zlog.mk                               |  2 +-
>  4 files changed, 3 insertions(+), 72 deletions(-)
>  delete mode 100644 package/zlog/0001-fix-compiling-on-Buildroot.patch
>  delete mode 100644 package/zlog/0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
