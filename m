From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 30 Jan 2009 12:25:08 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <8763jxnldm.fsf@macbook.be.48ers.dk>
References: <1233243053.15375.33.camel@sven>
	<87eiymru7j.fsf@macbook.be.48ers.dk> <1233309685.6293.17.camel@sven>
	<1233310475.6293.20.camel@sven>  <8763jxnldm.fsf@macbook.be.48ers.dk>
Message-ID: <1233314708.6293.26.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-01-30 at 11:23 +0100, Peter Korsgaard wrote:

>  Sven> BR2_GCC_TARGET_ABI="aapcs" seems to be accepted. I will try to compile
>  Sven> my tree with this option now and also check if I can build a recent
>  Sven> kernel using the compiler that results from this build...
> 
> Ok, thanks, otherwise I'll take the gcc patch so aapcs-linux works.

I've successfully built the system, booted it and run some tests. I also
verified that I can build 2.6.29-rc3 using the kernel created by this
build. Attached is a patch with the change.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: target-abi.diff
Type: text/x-patch
Size: 549 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090130/9ad2f21a/attachment.bin 
