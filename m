From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:35:16 +0200
Subject: [Buildroot] [PATCH] package/argus: drop empty line at end of
 .hash file
In-Reply-To: <1569780942-936-1-git-send-email-pjtexier@koncepto.io>
References: <1569780942-936-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190930213516.47733f83@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 20:15:42 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Fixes:
>  $: ./utils/check-package package/argus/*
>  package/argus/argus.hash:7: empty line at end of file
>  43 lines processed
>  1 warnings generated
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/argus/argus.hash | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
