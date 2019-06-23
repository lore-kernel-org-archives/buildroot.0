From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 16:06:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_sessreg: bump
 version to 1.1.2
In-Reply-To: <20190622182536.4356-1-bernd.kuhls@t-online.de>
References: <20190622182536.4356-1-bernd.kuhls@t-online.de>
Message-ID: <20190623160636.7071a3cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 20:25:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch which was applied upstream:
> https://gitlab.freedesktop.org/xorg/app/sessreg/commit/5b403d124c32c20fddc73bc5ae3c7e1febdf1bc4
> 
> Added all hashes provided by upstream, added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-missing_path_wtmpx.patch             | 24 -------------------
>  package/x11r7/xapp_sessreg/xapp_sessreg.hash  |  9 +++++--
>  package/x11r7/xapp_sessreg/xapp_sessreg.mk    |  2 +-
>  3 files changed, 8 insertions(+), 27 deletions(-)
>  delete mode 100644 package/x11r7/xapp_sessreg/0001-missing_path_wtmpx.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
