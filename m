From: Daiane Angolini <daiane.angolini@freescale.com>
Date: Tue, 23 Apr 2013 16:49:57 -0300
Subject: [Buildroot] linux/videodev.h missing
In-Reply-To: <BA6FC03EA0815D428FB8A3C279ED4992072B93F7@mx.toyon.corp>
References: <BA6FC03EA0815D428FB8A3C279ED4992072B8ECF@mx.toyon.corp>
 <5171D9E4.7090904@mind.be>
 <BA6FC03EA0815D428FB8A3C279ED4992072B900D@mx.toyon.corp>
 <5175A1C6.1050106@mind.be>
 <BA6FC03EA0815D428FB8A3C279ED4992072B9210@mx.toyon.corp>
 <517686B2.407@freescale.com>
 <BA6FC03EA0815D428FB8A3C279ED4992072B93F7@mx.toyon.corp>
Message-ID: <5176E5E5.3020309@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
