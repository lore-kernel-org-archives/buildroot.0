From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 22:27:09 +0200
Subject: [Buildroot] spurious rebuilds? Re: svn commit:
	trunk/buildroot:	target/linux toolchain/uClibc
In-Reply-To: <20070928194327.E4F34A69E5@busybox.net>
References: <20070928194327.E4F34A69E5@busybox.net>
Message-ID: <20070928202708.GV20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 12:43:27PM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-09-28 12:43:26 -0700 (Fri, 28 Sep 2007)
>New Revision: 20088
>
>Log:
>Cleanup cross toolchain admin, split uclibc-menuconfig into same + uclibc-update to avoid overwriting board support file

Ulf,

With these two changes (this one and the previous that touched these),
can you please build an image (with tarroot off), and then turn tarroot
on and make again.
I'm pretty sure that this used to just regenerate the target
"filesystems" and didn't lead to a complete rebuild (that i'm currently
enjoying)..

Please confirm.
