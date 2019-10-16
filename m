From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:54:23 +0200
Subject: [Buildroot] [PATCH] package/python-cheroot: fix Config.in
 indentation
In-Reply-To: <1571162686-8201-1-git-send-email-pjtexier@koncepto.io>
References: <1571162686-8201-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20191016215423.15d96f04@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 20:04:46 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Fixes:
> 
> $: ./utils/check-package package/python-cheroot/*
> package/python-cheroot/Config.in:7: continuation line should be indented using tabs
> 32 lines processed
> 1 warnings generated
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/python-cheroot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
