From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Nov 2014 11:28:09 -0300
Subject: [Buildroot] [PATCH 1/2] arch/powerpc: add fsl e5500 and e6500
 support
In-Reply-To: <CANQCQpbtbch9q-HKXFhQRkKxYpr1FD9nhebwpiaj=65O_Pm+xQ@mail.gmail.com>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>	<1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>
 <CANQCQpbtbch9q-HKXFhQRkKxYpr1FD9nhebwpiaj=65O_Pm+xQ@mail.gmail.com>
Message-ID: <546B5779.9010708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/2014 10:56 AM, Matthew Weber wrote:

> I'll try to give this a test when I get a chance, we currently have a
> e5500 target that we're building binaries for but with a e500mc
> toolchain (using arch compatibility mode on the processor).  Will the
> buildroot toolchain do multilib so that it's possible to build uboot
> 32/36bit and a kernel 64bit?  So far that's why we stuck with the
> e500mc (just 32/36bit) keeping us using a single toolchain.

We don't do proper multilib yet, so unfortunately you'll have to go with
separate BR projects for say kernel/bootloader (64 bit) and userland (32
bit).
Regards.
