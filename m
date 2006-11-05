From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 5 Nov 2006 12:39:57 +0100
Subject: [Buildroot] make from scratch bugs..
In-Reply-To: <20061105091300.GA11317@zelow.no>
References: <20061105091300.GA11317@zelow.no>
Message-ID: <20061105113957.GA14530@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 05, 2006 at 10:13:00AM +0100, Thomas Lundquist wrote:
> 
> just a simple .config, clean buildroot kernel headers 2.6.18, uClibC
> 0.9.28 (aka, not a snapshot).
> 
> make and then:
> 
> + ./extra/scripts/fix_includes.sh -k
> /home/thomasez/Buildroot/buildroot.clean/toolchain_build_i686/linux -t
> i386 -n
> Unable to determine version for kernel headers
> provided in directory
> /home/thomasez/Buildroot/buildroot.clean/toolchain_build_i686/linux
> make[1]: *** [headers] Error 1
> make[1]: Leaving directory
> `/home/thomasez/Buildroot/buildroot.clean/toolchain_build_i686/uClibc-0.9.28'
> make: ***
> [/home/thomasez/Buildroot/buildroot.clean/toolchain_build_i686/uClibc-0.9.28/.configured]
> Error 2
> 
> this is both using a .config that worked a month or two ago and a fresh
> one.

no problem with kernel headers 2.6.12.


Thomas.
