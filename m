From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:51:59 +0200
Subject: [Buildroot] [PATCH] meson: bump version to 0.46.0
In-Reply-To: <20180501202132.17687-1-eric.le.bihan.dev@free.fr>
References: <20180501202132.17687-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180501225159.11385362@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 22:21:32 +0200, Eric Le Bihan wrote:
> Bump version and drop obsolete patch.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...NotFoundError-when-restorecon-unavailable.patch | 31 ----------------------
>  package/meson/meson.hash                           |  4 +--
>  package/meson/meson.mk                             |  2 +-
>  3 files changed, 3 insertions(+), 34 deletions(-)
>  delete mode 100644 package/meson/0001-Fix-FileNotFoundError-when-restorecon-unavailable.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
