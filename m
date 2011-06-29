From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2011 16:55:17 +0200
Subject: [Buildroot] problems compiling uclibc for Geode (i386)
In-Reply-To: <4E0B3B3D.3090108@in-2-technology.co.uk>
References: <1309291371.21632.5.camel@bender> <1309350574.17457.5.camel@sven>
 <20110629164330.1f5780a7@skate>
 <4E0B3B3D.3090108@in-2-technology.co.uk>
Message-ID: <20110629165517.49e81d99@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please don't reply to me directly, but rather to the Buildroot list.

Le Wed, 29 Jun 2011 15:48:29 +0100,
Dominic Newton <dominic.newton@in-2-technology.co.uk> a ?crit :

> uclibc menuconfig correctly shows that the i386 sub-architecture does 
> not support NPTL. For some reason this is not picked up in the main 
> buildroot config options. I've not had time to see why. I normally
> run uclicb-menuconfig and see what is supported their as a double
> check at the moment.

Ah, then it's Buildroot that needs to be fixed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
