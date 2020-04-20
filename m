From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 18:00:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/stella: drop unneeded patches
In-Reply-To: <20200420150451.779129-1-fontaine.fabrice@gmail.com>
References: <20200420150451.779129-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420180022.70d3c112@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 17:04:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patches are not needed since bump to version 6.1.1 thanks to
> https://github.com/stella-emu/stella/commit/72932aa09e022ef38a9b58721d89a02a66c29aa4
> https://github.com/stella-emu/stella/commit/74450028fcf28f521951631570093494f17c4d95
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Add-cross-compilation-support.patch  | 29 ----------
>  package/stella/0002-undef-PAGE_SIZE.patch     | 53 -------------------
>  2 files changed, 82 deletions(-)
>  delete mode 100644 package/stella/0001-Add-cross-compilation-support.patch
>  delete mode 100644 package/stella/0002-undef-PAGE_SIZE.patch

Are you sure? These two patches are exactly the same as the commits you
point... and the patches still apply. So I suspect that the commits you
point are not part of this 6.1.1 release.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
