From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 9 Nov 2016 10:52:49 +0100
Subject: [Buildroot] [PATCH 1/4] configs: atmel: at91sam9260eknf: update
 defconfig
In-Reply-To: <20161109073638.ozgbr5vy6gglznlx@tarshish>
References: <20161109065948.1851-1-ludovic.desroches@atmel.com>
 <20161109065948.1851-2-ludovic.desroches@atmel.com>
 <20161109073638.ozgbr5vy6gglznlx@tarshish>
Message-ID: <20161109095249.bgurrb6bhujkgnac@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/2016 at 09:36:38 +0200, Baruch Siach wrote :
> Hi Ludovic,
> 
> On Wed, Nov 09, 2016 at 07:59:45AM +0100, Ludovic Desroches wrote:
> >  # Kernel
> >  BR2_LINUX_KERNEL=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
> 
> For the sake of reproducibility you should set this to the version you tested, 
> say, 4.8.6. The same goes for other patches in this series.
> 

I'm not sure this is actually useful because the amount of testing is
minimal and it just increases the maintenance burden.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
