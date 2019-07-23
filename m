From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 00:26:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/git: remove autoreconf
In-Reply-To: <20190723135200.30458-1-vadim4j@gmail.com>
References: <20190723135200.30458-1-vadim4j@gmail.com>
Message-ID: <20190724002602.0aa44803@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jul 2019 16:52:00 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> After (8aa5ee1721 package/git: bump to version 2.22.0) autoreconf
> is not needed anymore because patch which modified the configure
> script was removed.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/git/git.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
