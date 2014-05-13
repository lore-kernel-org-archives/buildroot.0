From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 May 2014 06:21:36 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-11
In-Reply-To: <20140513094426.335d2361@free-electrons.com>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140513094426.335d2361@free-electrons.com>
Message-ID: <5371E420.4080907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/13/2014 04:44 AM, Thomas Petazzoni wrote:

>>      avr32 |             btrfs-progs-3.14.1 | NOK | http://autobuild.buildroot.net/results/06501fd32c30549810c12f0ad50f510c4b74ee63/
> 
> Gustavo? Probably simply exclude btrfs-progs from avr32 ?

Hi.
Yes, toolchain issues at work, since btrfs is one of those "big storage"
filesystems and AVR32s don't have any big storage ports (or enough
resources in the cpu/memory department in general) it's better to
disable it.

>>    powerpc |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f1ca1a8f7ca8456003c6f17e146151a99835c4c0/
> 
> /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.so'
> 
> Gustavo, what is the status on this issue?

I'm trying a less agressive workaround that the one i've previously
cooked-up since it's no good this late in the release cycle.
Hopefully it'll work, fingers crossed.
Regards.
