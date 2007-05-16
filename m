From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 16 May 2007 13:02:26 +0200
Subject: [Buildroot] no gcc in rootfs.i386.ext2
In-Reply-To: <464AC2D4.9080306@belkam.com>
References: <464AC2D4.9080306@belkam.com>
Message-ID: <20070516110226.GC6566@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 16, 2007 at 01:37:40PM +0500, Dmitry Melekhov wrote:
>Hello!
>
>Sorry, I'm newbie.
>I want get root with gcc installed, gcc is compiled OK, but there is no
>gcc in rootfs.i386.ext2.
>What can be wrong?
>btw, I use yesterday svn...

I don't remember the exact wording of that option offhand, sorry.
Did you select "toolchain on the target" in menuconfig?
