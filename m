From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 20 Feb 2012 10:11:37 +0100
Subject: [Buildroot] opencv with glibc
In-Reply-To: <CAPeX=+s4-ne+AtwxGUxLVqpN2j89ykB1sZfZsa1DovTKPDBkuw@mail.gmail.com>
References: <CAPeX=+s4-ne+AtwxGUxLVqpN2j89ykB1sZfZsa1DovTKPDBkuw@mail.gmail.com>
Message-ID: <CAGm1_kuFQ=kt=XNNyr_4MzVAZb=QP5-M4A1-iakwz5UM64ux2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, what do you think about removing CMake toolchain file be make clean?

Yegor

On Thu, Feb 16, 2012 at 7:46 AM, Ozgun <ozgun.gunay@gmail.com> wrote:
>
> I download my BR from standard tree.
> My problem solved using "make distclean" instead of "make clean"
>
> thanks
>
>
>
>
> Date: Wed, 15 Feb 2012 22:26:03 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Ozgun <ozgun.gunay@gmail.com>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] opencv with glibc
> Message-ID: <20120215222603.6754b8e6@skate
>>
> Content-Type: text/plain; charset=UTF-8
>
> Le Wed, 15 Feb 2012 21:35:25 +0200,
> Ozgun <ozgun.gunay@gmail.com> a ?crit :
>
>> My br doesn't have output/toolchainfile.cmake file
>
> Which version of Buildroot are you using? Are you doing out-of-tree
> build (if so, then the toolchainfile.cmake file is in the output
> directory you selected with O=, not in output/).
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
