From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 15:04:00 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix bfin compile
In-Reply-To: <20160812204110.GA2187@waldemar-brodkorb.de>
References: <20160812204110.GA2187@waldemar-brodkorb.de>
Message-ID: <20160820150400.4ac2b801@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Aug 2016 22:41:10 +0200, Waldemar Brodkorb wrote:

> diff --git a/package/ffmpeg/0013-bfin-disable-optimization.patch b/package/ffmpeg/0013-bfin-disable-optimization.patch
> new file mode 100644
> index 0000000..38630d9
> --- /dev/null
> +++ b/package/ffmpeg/0013-bfin-disable-optimization.patch
> @@ -0,0 +1,19 @@
> +diff -Nur ffmpeg-2.8.7.orig/libavcodec/hevcdsp_template.c ffmpeg-2.8.7/libavcodec/hevcdsp_template.c
> +--- ffmpeg-2.8.7.orig/libavcodec/hevcdsp_template.c	2016-03-29 04:25:16.000000000 +0200
> ++++ ffmpeg-2.8.7/libavcodec/hevcdsp_template.c	2016-08-12 21:32:36.728178969 +0200

The patch lacks a description + SoB.

Also, could you please fill in a gcc PR for this issue, with a test
case (can be just the pre-processed hevcdsp_template.c file from
ffmpeg), and reference this PR in the patch description?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
