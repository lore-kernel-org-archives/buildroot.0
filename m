From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:29:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-asgiref: properly order
 "depends on" vs. bool
In-Reply-To: <1571688554-11921-1-git-send-email-pjtexier@koncepto.io>
References: <1571688554-11921-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20191021232905.3c2a5590@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 22:09:14 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> This fixes a check-package warning introduced by commit
> 9b746f8 ("package/python-asgiref: drop Python 2 support")
> Fixes:
> 
> $: ./utils/check-package package/python-asgiref/*
> package/python-asgiref/Config.in:3: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
> 34 lines processed
> 1 warnings generated
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/python-asgiref/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
