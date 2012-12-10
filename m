From: Willy Lambert <lambert.willy@gmail.com>
Date: Mon, 10 Dec 2012 22:30:39 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <878v95skvm.fsf@dell.be.48ers.dk>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
Message-ID: <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/10 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:
>
> Hi,
>
>  >> I don't think so. I just did a:
>  >>
>  >> make at91sam9263ek_defconfig && make
>  >>
>  >> Without any problems. What exactly did you do?
>
>  Willy> make.
>
> With what configuration? 'make' with a clean tree will just run
> menuconfig for you.
>

Yes, so I just quit it so it leaves the default config (which seems to
have a problem with large file)

>  Willy> just make after having DL latest stable version few days ago from a
>  Willy> tgz. Doing a make menuconfig don't change anything, and as far as I
>  Willy> can remember, menuconfig was telling us about this problem (something
>  Willy> depending on largefile).
>
> Did you perhaps forget to run 'make clean' after changing something in
> your toolchain configuration?

I'm quite sure I did it (make clean + make distclean + rm ccache). But
to be sure I'll retry from zero tomorrow.

I'm not blocked I already have my root image (with large file
enabled), I'm currently setting up qemu to test it, our remark is just
that default config seems dummy.

>
>  Willy> (and BTW, hi all, I'm new with buildroot).
>
> Welcome!
>

Thanks !

> --
> Bye, Peter Korsgaard
