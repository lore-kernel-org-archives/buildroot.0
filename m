From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Mar 2012 11:01:59 +0100
Subject: [Buildroot] [U-Boot] Craneboard with Uboot and xloader
In-Reply-To: <CABMxt4h6GjQD7tWZtNE=vVbNgC1Kx-_uGWviSt9d14A_jAp3ug@mail.gmail.com>
References: <CABMxt4ic6cZ_xfrtkouKkw2OWSbOiL95tXrz9XgKyqUAd4U-6A@mail.gmail.com>
 <CABMxt4hMc3CjnjFEQNTjzsfxyXgBoyO8uMg1xsmaTeZ2pWXRRQ@mail.gmail.com>
 <CA+M6bXk7yKi8VFQRbYT-SQZMwM9eneBzjx2NB9KpHeicxkDb9Q@mail.gmail.com>
 <CABMxt4ja3EmjER5ywn5R+OLxkXy-Ho-cZ89LLuML4qX50ews=w@mail.gmail.com>
 <CA+M6bX=A1Mie8Q093Sa3bp_hSxSRFR6z4-sNBvJP3982e_HPqQ@mail.gmail.com>
 <CABMxt4gYMf_JjfYi_2YttUL2NDNYC4974Kq_--++B2yPgf0xUg@mail.gmail.com>
 <CA+M6bXktYKXisQEiS11CNixozV7KtzwajKsXyTPNXSEOjxz3AA@mail.gmail.com>
 <CABMxt4hoihH2pJk5GZ6hpt0K3Vm_Qzg8eL1ej-bFH67DOSNUqA@mail.gmail.com>
 <CABMxt4jZhMcZS=0P9Le3ZHO_NUJJt0Deta_Ybdd-ghdPPuGz2A@mail.gmail.com>
 <CA+M6bXnNxFhzQpDOQhuSM7VKEh41dazMmUeEv=VTdVUuNoQhAw@mail.gmail.com>
 <CABMxt4ixVGvV_LvduJSNmWevxiEvFv0GdRHpomK325bKp4T20A@mail.gmail.com>
 <4F550BC3.80601@ti.com>
 <CABMxt4g9Xm6=QPhH1U2oDKVbXNjnPaxq_y71pUS4WF2LUG1RSw@mail.gmail.com>
 <20120306103333.45e7857d@skate>
 <CABMxt4h6GjQD7tWZtNE=vVbNgC1Kx-_uGWviSt9d14A_jAp3ug@mail.gmail.com>
Message-ID: <20120306110159.3ef15a95@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please do not cross-post this to the U-Boot mailing list, it has no
relation at all to U-Boot.

Le Tue, 6 Mar 2012 10:58:21 +0100,
Mohamed HAMZAOUI <requinham@gmail.com> a ?crit :

> The first problem is the lack of informations about Craneboard in the
> craneboard TI wiki for example the display over DVI informations...
> 
> the other problem is that impossible to use BUILDROOT to create a
> distribution for Craneboard with any vanilla kernel version (2.6.37;
> 2.6.39.1,..). the only version that works is that provided by TI and
> it's based on 2.6.32 vanilla kernel which is an older version for
> many tools. We need a little description how to adapt Buildroot for
> compiling any recent kernel version and other things for working on
> Craneboard ! we need a kernel config file who work with recent
> version of vanilla kernel and not generate a compile error or a
> kernel panic when booting !
> 
> I tested all the possibilities with Buildroot 2012.02 and nothing
> works.

Please report specific problems and not things like "nothing works".

Buildroot is only very loosely related to the kernel version. Buildroot
simply downloads the kernel source code, extracts it, applies the
configuration you have choosen and builds it. This procedure is
completely independent of the kernel version.

So, most likely, if one kernel version works and another doesn't work,
it's not Buildroot's fault, but rather the kernel itself that has
issues with your particular hardware platform.

Again, please report specific problems, like:

 I am using Buildroot 2012.02 with the configuration file visible at
 (put here some URL of pastebin with your Buildroot configuration) and
 I'm having the following problem: ...

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
