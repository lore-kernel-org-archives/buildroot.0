From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 11:36:42 +0100
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: bump to version 2.22.3
In-Reply-To: <20181031100424.92554-1-aperez@igalia.com>
References: <20181031100424.92554-1-aperez@igalia.com>
Message-ID: <20181031113642.19f20615@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Oct 2018 12:04:24 +0200, Adrian Perez de Castro wrote:
> Release notes:
> 
>     https://webkitgtk.org/2018/10/29/webkitgtk2.22.3-released.html
> 
> Patch "0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch"
> is removed because it is included in the new release.
> 
> This is a maintenance release which further improves playback of video
> when using media source extensions (MSE), specially for WebM content,
> and provides a few correctness fixes.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> ---
> Changes v1 -> v2:
>   - Fix wrong tarball file name in webkitgtk.hash

Looks better. Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
