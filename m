From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 26 Nov 2015 23:50:57 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-11-24
In-Reply-To: <20151125073016.04443102495@stock.ovh.net>
References: <20151125073016.04443102495@stock.ovh.net>
Message-ID: <1448581857.2773.35.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2015-11-25 at 08:30 +0100, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-11-24
> ===============================
> 
>         success : 4  
>        failures : 3  
>        timeouts : 0  
>           TOTAL : 7  
> 
> Classification of failures by reason
> ====================================
> 
>              util-linux-2.27.1 | 1 
> libbroadvoice-f65b0f50c8c76... | 1 
>                  mesa3d-11.0.4 | 1 
> 
> Detail of failures
> ===================
> 
>          arc | libbroadvoice-f65b0f50c8c76... | NOK | 
> http://autobuild.buildroot.net/results/9976de5802c2ad097da178994237c2dc6201fee7/

This one is fixed with http://git.buildroot.net/buildroot/commit/?id=c2ca1279bc8ebdb2e3dfc1f1fc64308ea538e814

>          arc |                  mesa3d-11.0.4 | NOK | 
> http://autobuild.buildroot.net/results/43501dcabaa3cf312d41856c67a7f38971ce8f07/

We're working with our tools people to resolve that.

>          arc |              util-linux-2.27.1 | NOK | 
> 
> http://autobuild.buildroot.net/results/1925e6797552c079c67652f97ec8c4222c00a6ce/

This one is fixed with http://patchwork.ozlabs.org/patch/549236/

-Alexey
