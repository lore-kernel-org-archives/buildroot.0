From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:08:36 +0200
Subject: [Buildroot] [PATCH 1/1] file: bump to version 5.34
In-Reply-To: <20180909205208.30737-1-fontaine.fabrice@gmail.com>
References: <20180909205208.30737-1-fontaine.fabrice@gmail.com>
Message-ID: <20180910170836.3d824ee3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 22:52:08 +0200, Fabrice Fontaine wrote:
> Remove patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ding-past-the-end-of-buffer-Rui-Reis.patch | 30 -------------------
>  package/file/file.hash                        |  2 +-
>  package/file/file.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 32 deletions(-)
>  delete mode 100644 package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
