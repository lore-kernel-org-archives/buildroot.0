From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 20 Mar 2007 19:43:46 +0100
Subject: [Buildroot] Problem involving libc/libc_so.a(pread_write.os)
In-Reply-To: <1174413454.32392.4.camel@tintin>
References: <1174413454.32392.4.camel@tintin>
Message-ID: <20070320184346.GA24948@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 20, 2007 at 01:57:33PM -0400, Eric P Caillibot wrote:
>Hello,
>
>I am trying to set up Buildroot on a host running ubuntu, my target
>being a powerpc 405, running version 2.4.26 of the Linux kernel.

>  STRIP -x -R .note -R .comment lib/libc.a
>  AR cr lib/libc.a
>  STRIP -x -R .note -R .comment lib/uclibc_nonshared.a
>  AR cr lib/uclibc_nonshared.a
>  AR cr libc/libc_so.a
>  LD libuClibc-0.9.29.so
>libc/libc_so.a(pread_write.os):(.text+0x14): undefined reference to
>`__illegally_sized_syscall_arg4'

You should ask this on the uclibc list.
