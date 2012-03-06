From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Tue, 6 Mar 2012 10:58:21 +0100
Subject: [Buildroot] [U-Boot] Craneboard with Uboot and xloader
In-Reply-To: <20120306103333.45e7857d@skate>
References: <CABMxt4ic6cZ_xfrtkouKkw2OWSbOiL95tXrz9XgKyqUAd4U-6A@mail.gmail.com>
 <20120224150232.GA2346@bill-the-cat>
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
Message-ID: <CABMxt4h6GjQD7tWZtNE=vVbNgC1Kx-_uGWviSt9d14A_jAp3ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first problem is the lack of informations about Craneboard in the
craneboard TI wiki for example the display over DVI informations...

the other problem is that impossible to use BUILDROOT to create a
distribution for Craneboard with any vanilla kernel version (2.6.37;
2.6.39.1,..). the only version that works is that provided by TI and it's
based on 2.6.32 vanilla kernel which is an older version for many tools. We
need a little description how to adapt Buildroot for compiling any recent
kernel version and other things for working on Craneboard ! we need a
kernel config file who work with recent version of vanilla kernel and not
generate a compile error or a kernel panic when booting !

I tested all the possibilities with Buildroot 2012.02 and nothing works.

Thank you for your help

On Tue, Mar 6, 2012 at 10:33 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Tue, 6 Mar 2012 10:19:57 +0100,
> Mohamed HAMZAOUI <requinham@gmail.com> a ?crit :
>
> > So far I have not been able to compile another kernel version other
> > than ( https://github.com/craneboard/craneboard-kernel.git) with
> > buildroot.
>
> What problems do you have?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120306/d08508ed/attachment.html>
