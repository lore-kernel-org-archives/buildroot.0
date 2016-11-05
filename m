From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 17:16:36 +0100
Subject: [Buildroot] freescale_imx31_3stack_defconfig fails to build
In-Reply-To: <6234984d-6409-37c1-b050-504775d37c17@bergerie>
References: <20161105143516.00291507@free-electrons.com>
 <6234984d-6409-37c1-b050-504775d37c17@bergerie>
Message-ID: <20161105171636.514e707e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 Nov 2016 16:55:34 +0100, Vincent Stehl? wrote:

> > Has one of you access to this platform, and be willing to update this
> > defconfig?  
> 
> Hi Thomas and Fabio,
> 
> I am sorry to say that I don't have access to an i.MX31 PDK anymore. The
> one I used by the time was already a "rare" resource in Freescale France :)
> 
> I will try to help repair the build at least.

If this platform is difficult to get access to, and rarely used, then
maybe we should just remove the defconfig in Buildroot? It doesn't make
a lot of sense to have defconfig for platforms that are not in use.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
