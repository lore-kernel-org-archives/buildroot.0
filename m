From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:53:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/aufs: add support for linux 5.x
In-Reply-To: <20200225122913.8255-1-skif@skif-web.ru>
References: <20200225122913.8255-1-skif@skif-web.ru>
Message-ID: <20200226205318.5ad5248e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Feb 2020 15:29:13 +0300
Alexey Lukyanchuk <skif@skif-web.ru> wrote:

> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> ---
>  linux/Config.ext.in  | 9 ++++++++-
>  package/aufs/aufs.mk | 2 ++
>  2 files changed, 10 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
