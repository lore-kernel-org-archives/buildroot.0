From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 May 2019 22:47:40 +0200
Subject: [Buildroot] [PATCH] package/minicom: bump to version
 1e84585e8e7710677b6ff9a70dce5f3ad3e23540
In-Reply-To: <20190428100931.115748-1-giulio.benetti@micronovasrl.com>
References: <eb06aafc-01f9-5c1d-aebf-f8eccb2ee8ad@micronovasrl.com>
 <20190428100931.115748-1-giulio.benetti@micronovasrl.com>
Message-ID: <7bbf1289-491d-6eb0-4efe-199ba1fb6528@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/04/2019 12:09, Giulio Benetti wrote:
> Remove both patches since they've been upstreamed.
> 
> Add host-pkgconf to MINICOM_DEPENDENCIES and remove:
> `MINICOM_CONF_ENV = PKG_CONFIG=/bin/false` since now pkg-config is
> needed to build.
> 
> Shortlog follows:
> git shortlog --no-merges  19ab49422f3431102c31fea01549121385113f80..
> Adam Lackorzynski (9):
>       Update project URL
>       Updated translations
>       Updated translations: pl and sv
>       Translations: regen update
>       Update danish translation
>       Update of danish translation
>       Update README
>       Formatting fix
>       More friendly mbslength test
> 
> Fabrice Fontaine (1):
>       src/Makefile.am: fix ascii-xfr link with lintl
> 
> Giulio Benetti (2):
>       TODO: remove Utf8 bug.
>       sysdep1: check if RS485 is support before setting its parameters
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

 Applied to master, thanks.

 Regards,
 Arnout
