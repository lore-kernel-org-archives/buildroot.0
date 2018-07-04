From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 21:45:46 +0200
Subject: [Buildroot] [PATCH] package/exim: remove unused Local-Makefile
In-Reply-To: <20180703210708.30017-1-arnout@mind.be>
References: <20180703210708.30017-1-arnout@mind.be>
Message-ID: <20180704214546.19998c5f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Jul 2018 23:07:08 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> When the exim package was added, it included a template for the
> build-time configuration file Local/Makefile in the package directory.
> In commit 8956779d5d2 (exim: use a more standard build-time
> configuration), this template file was replaced with the EDITME
> template file included in the exim sources. However, that commit did
> not remove Buildroot's Local-Makefile.
> 
> Since this file is no longer used, remove it.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks!

> I thought I had sent this patch a while ago, but I can't find it in
> patchwork...

I don't remember seeing in on the list.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
