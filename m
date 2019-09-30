From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:35:22 +0200
Subject: [Buildroot] [PATCH] package/sdl2_ttf: remove trailing whitespace
In-Reply-To: <1569780917-726-1-git-send-email-pjtexier@koncepto.io>
References: <1569780917-726-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190930213522.22920519@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 20:15:17 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Fixes:
>  $: ./utils/check-package package/sdl2_ttf/*
>  package/sdl2_ttf/sdl2_ttf.hash:1: line contains trailing whitespace
>  42 lines processed
>  1 warnings generated
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/sdl2_ttf/sdl2_ttf.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
