From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:42:45 +0200
Subject: [Buildroot] [PATCH 1/4] libsigrok: bump version to 0.5.0
In-Reply-To: <1498483305-17826-2-git-send-email-brgl@bgdev.pl>
References: <1498483305-17826-1-git-send-email-brgl@bgdev.pl>
 <1498483305-17826-2-git-send-email-brgl@bgdev.pl>
Message-ID: <20170702004245.6f4e68cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Jun 2017 15:21:42 +0200, Bartosz Golaszewski wrote:
> The patch is now upstream and can be removed.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  ...01-beaglelogic.h-fix-build-with-musl-libc.patch | 36 ----------------------
>  package/libsigrok/libsigrok.hash                   |  2 +-
>  package/libsigrok/libsigrok.mk                     |  2 +-
>  3 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch

All four patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
