From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Dec 2010 08:55:59 +0100
Subject: [Buildroot] ERROR building udev 164
In-Reply-To: <51CCAFA87DB74E16BA5996665798BF93@apexjs>
References: <51CCAFA87DB74E16BA5996665798BF93@apexjs>
Message-ID: <20101216085559.62d5cb53@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Dec 2010 01:21:53 +0100
"Sagaert Johan" <sagaert.johan@skynet.be> wrote:

> I  used the patch from the mailinglist ,
>  
> When building it end with an error SOCK_CLOEXEC undeclared 
>  
> It seems this is something not available in uclibc.
>  
> Regards Johan
>  
> http://lists.busybox.net/pipermail/buildroot/2010-December/039348.html

This has been fixed in uClibc git, but is not yet available in any
release. Can you try to put the patch
http://git.buildroot.net/uClibc/commit/?id=83333e9c873e4eca6b2c945f7770b1f5373b0427
in toolchain/uClibc/uClibc-0.9.31-add-sock-cloexec.patch, and retry ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
