From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 16 Nov 2015 22:03:30 +0200
Subject: [Buildroot] [PATCH 1/2] vboot-utils: new package
In-Reply-To: <20151116184237.GL9908@tarshish>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <39f87349d2f42ac5d2acec7a00c94c4e5e9400a8.1447689401.git.alex.suykov@gmail.com>
 <20151116184237.GL9908@tarshish>
Message-ID: <20151116200330.GA4340@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mon, Nov 16, 2015 at 08:42:37PM +0200, Baruch Siach wrote:

> > +VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
> > +VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
> > +VBOOT_UTILS_SITE_METHOD = git
> > +VBOOT_UTILS_LICENSE = BSD
> 
> Please add 'VBOOT_UTILS_LICENSE_FILES = LICENSE'.

Done, v2 patch sent.
