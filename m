From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 10:55:34 +0100
Subject: [Buildroot] [PATCH 1/2 v2] xtensa: add support for the Xtensa
 architecture
In-Reply-To: <509D35D3.6070607@mind.be>
References: <509ca3b9.e9c5440a.24b8.24a1@mx.google.com>
 <20121109101959.70d640d5@skate> <509D35D3.6070607@mind.be>
Message-ID: <20121110105534.614885e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 09 Nov 2012 17:56:51 +0100, Arnout Vandecappelle wrote:

>   I get these same error with the default bfin config, and it also breaks
> with BR2_PTHREADS_NONE=y

Right, I should fix the Blackfin architecture so it uses the external
toolchain instead. I don't think gcc/uclibc/binutils have upstream the
needed code to build a Blackfin toolchain. We could certainly point
Buildroot to the Blackfin specific gcc/uclibc/binutils repositories, if
someone has a usage for the internal backend on Blackfin.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
