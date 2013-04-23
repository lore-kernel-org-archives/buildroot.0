From: Daiane Angolini <daiane.angolini@freescale.com>
Date: Tue, 23 Apr 2013 17:38:05 -0300
Subject: [Buildroot] linux/videodev.h missing
In-Reply-To: <BA6FC03EA0815D428FB8A3C279ED49920526E37C@mx.toyon.corp>
References: <BA6FC03EA0815D428FB8A3C279ED49920526E37C@mx.toyon.corp>
Message-ID: <5176F12D.6050401@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/2013 04:57 PM, Richard Cagley wrote:
> I need imx-lib for the gstreamer fsl plugins. If you know of a different
> way to get the gstreamer hardware acclerated plugins I'd love to not
> deal with imx-lib.

Try to use any version, configure it for imx5 and don't care if you have 
any error outside libvpu.

For example, a lot of issues is for libipu

I don't have the buildroot source code yet downloaded, and I have no 
idea how to include a new package, but I can try to help you on that 
one, let's talk offline

Daiane
