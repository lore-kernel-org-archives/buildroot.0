From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:56:12 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/gst1-plugins-ugly: bump
 version to 1.18.0
In-Reply-To: <20200924211715.7433-1-ps.report@gmx.net>
References: <20200924211715.7433-1-ps.report@gmx.net>
Message-ID: <20200926155612.5d185299@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Sep 2020 23:17:11 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change home page url to https
> 
> - meson options: doc=disabled
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - no changes (despite the applied message [1] no commit apears on git master)
>     [1] http://lists.busybox.net/pipermail/buildroot/2020-September/293062.html
> ---
>  package/gstreamer1/gst1-plugins-ugly/Config.in              | 2 +-
>  package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 6 +++---
>  package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 5 +++--
>  3 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks. While looking at this package, I noticed
that the LICENSE variable was not correctly formatted when GPL-licensed
plugins are enabled. So I did a follow-up commit to fix this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
