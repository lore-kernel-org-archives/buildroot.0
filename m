From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:27:45 +0200
Subject: [Buildroot] [PATCH 0/5 v4] package/xenomai: add alternate
 download locations (branch yem/xenomai-custom)
In-Reply-To: <cover.1579035147.git.yann.morin.1998@free.fr>
References: <cover.1579035147.git.yann.morin.1998@free.fr>
Message-ID: <20200624232745.548bdf7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Jan 2020 21:55:20 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Jan Kiszka (1):
>       package/xenomai: add support to download from a custom git tree

Applied.

> 
> Yann E. MORIN (4):
>       package/xenomai: move the version setting to Kconfig
>       package/xenomai: add support to download a custom tarball

Both applied.

>       package/xenomai: add support to download from a custom Hg tree
>       package/xenomai: add support to download from a custom svn tree

I have not applied those ones, I think it's too unlikely to ever be
needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
