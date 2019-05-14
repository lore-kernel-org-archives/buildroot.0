From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 19:23:36 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: bump to v2019.01.0
In-Reply-To: <20190510083742.5182-1-m.niestroj@grinn-global.com>
References: <20190510083742.5182-1-m.niestroj@grinn-global.com>
Message-ID: <20190514192336.48e2ad2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 May 2019 10:37:42 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Also drop patch which is part of new release.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  ...ion-for-glibc-version-2.27.9000-36.f.patch | 75 -------------------
>  package/dt-utils/dt-utils.hash                |  2 +-
>  package/dt-utils/dt-utils.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 77 deletions(-)
>  delete mode 100644 package/dt-utils/0001-src-fix-compilation-for-glibc-version-2.27.9000-36.f.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
