From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 May 2016 21:24:29 +0200
Subject: [Buildroot] Problem with cuImage on 83x
In-Reply-To: <001701d1af64$acb860d0$06292270$@gmail.com> (Giuseppe Lippolis's
 message of "Mon, 16 May 2016 13:18:29 +0200")
References: <001701d1af64$acb860d0$06292270$@gmail.com>
Message-ID: <87a8jpg61e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giuseppe" == Giuseppe Lippolis <giu.lippolis@gmail.com> writes:

Hi,

 > But I do not see anything in the console.
 > The problem seems releted to the vmlinux call in arc/powerpc/boot/main.c

 > kentry = (kernel_entry_t) vmlinux.addr;

 > Any suggestion?

I haven't personally worked with mpc834x since 2009 or so - So I don't
recall any details. Perhaps ask on the linuxppc list
(linuxppc-dev at lists.ozlabs.org)?

-- 
Bye, Peter Korsgaard
