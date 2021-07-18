From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:39:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump to version
 2021-06-R1
In-Reply-To: <20210717151159.1094518-1-fontaine.fabrice@gmail.com>
References: <20210717151159.1094518-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718233926.481bdffc@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 17 Jul 2021 17:11:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - C++14 is mandatory since version 2021-05-R1 and
>   https://github.com/kismetwireless/kismet/commit/35fefe38054f40014aae7ade9eb80c1c7f7c6c30
> 
> https://www.kismetwireless.net/release/kismet-2021-05-R1
> https://www.kismetwireless.net/release/kismet-2021-06-R1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...to-read-database-values-as-long-long.patch | 28 --------
>  ...sio-Use-eventfd-function-with-uClibc.patch | 66 -------------------
>  package/kismet/Config.in                      | 18 ++---
>  package/kismet/kismet.hash                    |  2 +-
>  package/kismet/kismet.mk                      |  5 +-
>  5 files changed, 11 insertions(+), 108 deletions(-)
>  delete mode 100644 package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch
>  delete mode 100644 package/kismet/0002-boost-asio-Use-eventfd-function-with-uClibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
