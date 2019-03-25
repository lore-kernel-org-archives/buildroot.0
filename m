From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 18:51:34 +0100
Subject: [Buildroot] [PATCH v5 1/2] Revert "gst1-libav: switch to
 unbundled"
In-Reply-To: <20190323122818.32101-1-bernd.kuhls@t-online.de>
References: <20190323122818.32101-1-bernd.kuhls@t-online.de>
Message-ID: <20190325185134.710ea04b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 23 Mar 2019 13:28:17 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> This reverts commit 5dcb8aa0ba46e16b929c7c7fc9cea2d6c26201f4.
> 
> This patch re-enables the usage of bundled ffmpeg code because
> gst1-libav 1.14.x is blocking the bump to ffmpeg 4.x.
> 
> A fix to build the bundled ffmpeg code on arm/aarch64 was added.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v5: no changes, gstreamer 2.16.x with support for ffmpeg 4.x
>     was not released yet

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
