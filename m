From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 17:39:11 +0100
Subject: [Buildroot] Freescale specific kernel header to compile imx-lib
In-Reply-To: <000b01ceeb8d$1d460fd0$57d22f70$@gmail.com>
References: <000b01ceeb8d$1d460fd0$57d22f70$@gmail.com>
Message-ID: <20131127173911.3f97da37@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Schnegg,

On Wed, 27 Nov 2013 17:24:12 +0100, Alexandre Schnegg wrote:

>  My question is : can I get this header on my cross-compile machine running
> Ubuntu 13.04 or am I forced to use a Freescale BSP and do a native
> compilation ?

You simply need to tell Buildroot to build a Linux kernel that is
Freescale specific, and therefore contains these headers. The imx-lib
package will look directly into the kernel sources for those i.MX
specific headers.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
