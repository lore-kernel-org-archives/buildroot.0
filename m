From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 09:52:57 +0200
Subject: [Buildroot] [PATCH v3 0/9] configs: defconfigs for Atmel boards
In-Reply-To: <20150519175709.GA3338@piout.net>
References: <1432045308-16825-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20150519174404.5d19d2cf@free-electrons.com>
 <20150519175709.GA3338@piout.net>
Message-ID: <20150520095257.1ad30aa7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex,

On Tue, 19 May 2015 19:57:09 +0200, Alexandre Belloni wrote:
> > Ah, so the TCL script is available somewhere upstream? In this case,
> > why don't we create a simple Buildroot package to download it and
> > install it somewhere, instead of having it copy/pasted inside Buildroot?
> 
> It is not really available per se. It is distributed alongside with the
> demos in a 160MB and more often than not is only aimed at supporting the
> specific SoC supported by the demo.

Ok. Then let's keep it the way you did it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
