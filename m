From: Leonid <Leonid@a-k-a.net>
Date: Mon, 1 Oct 2007 19:34:18 -0700
Subject: [Buildroot] Using pre-built BUILDROOT toolchain as external
	toolchain.
In-Reply-To: <20071001211634.063E9A6823@busybox.net>
References: <20071001211634.063E9A6823@busybox.net>
Message-ID: <406A31B117F2734987636D6CCC93EE3C0246E9E8@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

I want to build toolchain only once and then use it as external
toolchain (well, last is not important, I just don't want make re-build
all toolchain binaries again every time). I have compiled buildroot and
have got both toolchain and working filesystem (I'm using ext2
filesystem, running in ramdisk).

Then I have copied created toolchain to another directory and using
"make menuconfig" switched to external toolchain and specified the
toolchain path/prefix and have rebuilt buildroot. It builds all right
but resulting file system lacks certain libraries which is to be
expected since I didn't define what libraries shall be copied from
external toolchain. Where I can get list of libraries, buildroot
toolchain copies? What else should be defined to make whole scheme work?

Thanks,

Leonid.
