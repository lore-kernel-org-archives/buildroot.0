From: Richard Cagley <rcagley@toyon.com>
Date: Tue, 23 Apr 2013 12:57:02 -0700
Subject: [Buildroot] linux/videodev.h missing
Message-ID: <BA6FC03EA0815D428FB8A3C279ED49920526E37C@mx.toyon.corp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need imx-lib for the gstreamer fsl plugins. If you know of a different way to get the gstreamer hardware acclerated plugins I'd love to not deal with imx-lib.


----- Original Message -----
From: Daiane Angolini <daiane.angolini@freescale.com>
To: Richard Cagley
Cc: Arnout Vandecappelle <arnout@mind.be>; buildroot at busybox.net <buildroot@busybox.net>
Sent: Tue Apr 23 12:49:57 2013
Subject: Re: [Buildroot] linux/videodev.h missing

On 04/23/2013 03:51 PM, Richard Cagley wrote:
> It's a Karo TX53 board. I've tried their kernel, the buildroot one for
> buildroot-2013.02 (imx_v6_v7 defconfig), the freescale git that Arnout
> pointed out...none seem to have matching headers.
>
> Yes, I can basically copy videodev2.h to videodev.h but that only fixes
> one problem. After that it's sort of a wormhole of missing header files.
> Note, this is only for imx-lib configured as mx53...mx6 appears to be
> fine.

How do you configure it as mx53?

I've been using PLATFORM="IMX5"

if you use PLATFORM="IMX53" you will face more errors.

Why do you need imx-lib?

Daiane

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130423/9cb5a400/attachment.html>
