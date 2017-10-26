From: Seamus Connor <sconnor@lynx.com>
Date: Thu, 26 Oct 2017 12:16:26 -0700
Subject: [Buildroot] [PATCH 0/1] fs/cpio: add option to manually specify
	file list
In-Reply-To: <Multiple root filesystems for single kernel/toolchain>
References: <Multiple root filesystems for single kernel/toolchain>
Message-ID: <20171026191627.18949-1-sconnor@lynx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Again, in my use case I require an initramfs.  However my system is
memory restricted so I cannot use my full rootfs image.  This series
contains the modifications that I made to support this. I am not sure if
this is generally useful to the larger buildroot community, but I
figured since Arnout and Peter were kind enough to give me pointers I
should share the changes I made in case someone else can benefit from
them.

-Seamus
