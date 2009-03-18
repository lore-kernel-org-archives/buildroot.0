From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 18 Mar 2009 13:30:04 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090318122515.GB27893@whatever.nu>
References: <20090318112308.GA27893@whatever.nu>
	<20090318114711.GA19956@buzzloop.caiaq.de>
	<20090318122515.GB27893@whatever.nu>
Message-ID: <20090318123004.GE18723@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 18, 2009 at 01:25:15PM +0100, Per-Henrik Lundblom wrote:
> /home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/toolchain_build_arm/gcc-4.3.2-initial/./gcc/xgcc
> -B/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/toolchain_build_arm/gcc-4.3.2-initial/./gcc/
> -B/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin/
> -B/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/
> -isystem
> /home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/include
> -isystem
> /home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/sys-include
> checking for suffix of object files... configure: error: cannot compute
> suffix of object files: cannot compile
> See `config.log' for more details.

So, what does config.log say? And what's your native configuration (gcc,
binutils, ...)?

Daniel
