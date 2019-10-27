From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:25:33 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libkcapi: bump version to
 1.1.5
In-Reply-To: <20190831115005.19866-1-bernd.kuhls@t-online.de>
References: <20190831115005.19866-1-bernd.kuhls@t-online.de>
Message-ID: <20191027142533.5e232a21@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Aug 2019 13:50:05 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch applied upstream:
> https://github.com/smuellerDD/libkcapi/commit/52620ec798a580b2053d16a42362e9926729eb30
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...pi-hasher.c-fix-build-with-gcc-8.2.x.patch | 54 -------------------
>  package/libkcapi/libkcapi.hash                |  2 +-
>  package/libkcapi/libkcapi.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 56 deletions(-)
>  delete mode 100644 package/libkcapi/0001-apps-kcapi-hasher.c-fix-build-with-gcc-8.2.x.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
