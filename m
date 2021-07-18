From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:25:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/libndp: drop patch
In-Reply-To: <20210619172148.295788-1-fontaine.fabrice@gmail.com>
References: <20210619172148.295788-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718232513.714047a5@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 19 Jun 2021 19:21:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patch is not needed since bump to version 1.7 in commit
> 6274f4191335cf8c9b88796f59da8af04e3abf7a and
> https://github.com/jpirko/libndp/commit/94e9a082d76414f82794b0c9817d0c24e3868275
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-ndptool.c-Fix-musl-build.patch       | 30 -------------------
>  1 file changed, 30 deletions(-)
>  delete mode 100644 package/libndp/0001-ndptool.c-Fix-musl-build.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
