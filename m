From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:58:41 +0200
Subject: [Buildroot] [PATCH] package/mxml: bump to version 3.2
In-Reply-To: <1603132129-2372-1-git-send-email-pjtexier@koncepto.io>
References: <1603132129-2372-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20201024225841.64b30cc3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Oct 2020 20:28:49 +0200
Pierre-Jean Texier via buildroot <buildroot@busybox.net> wrote:

> The hash of the NOTICE file has changed due to the following minor update:
> 
> -Exceptions to the Apache 2.0 License:
> -=====================================
> +(Optional) Exceptions to the Apache 2.0 License:
> +================================================
> 
> Also update hash file formatting (2 spaces)
> 
> See changelog https://github.com/michaelrsweet/mxml/releases/tag/v3.2
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/mxml/mxml.hash | 6 +++---
>  package/mxml/mxml.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
