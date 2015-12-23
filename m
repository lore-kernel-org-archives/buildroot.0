From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 23:52:53 +0100
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <1450910736.3752716.475291418.490BB3EA@webmail.messagingengine.com>
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
 <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
 <20151223193943.21a6f0fc@free-electrons.com>
 <1450910736.3752716.475291418.490BB3EA@webmail.messagingengine.com>
Message-ID: <20151223235253.0afe702e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Craig Swank,

On Wed, 23 Dec 2015 14:45:36 -0800, Craig Swank wrote:
> Is it strange to you that when I do the build the output/build directory
> has both of these dirs?
> 
> ?  buildroot git:(master) ? ls output/build/linux-*
> output/build/linux-4.1.4-ti-r9
> output/build/linux-headers-3.12.10

No, it is perfectly fine. linux-headers is used when building the
toolchain. linux is used to build the kernel itself.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
