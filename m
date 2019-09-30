From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:35:09 +0200
Subject: [Buildroot] [PATCH] linux: fix indentation
In-Reply-To: <1569780965-1224-1-git-send-email-pjtexier@koncepto.io>
References: <1569780965-1224-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190930213509.3c18223b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 20:16:05 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Fixes:
>  $: ./utils/check-package linux/*
>  linux/linux.mk:528: expected indent with tabs
>  1318 lines processed
>  1 warnings generated
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
