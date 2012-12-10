From: Willy Lambert <lambert.willy@gmail.com>
Date: Mon, 10 Dec 2012 20:38:37 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <87d2yhsoh8.fsf@dell.be.48ers.dk>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
Message-ID: <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
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
>  >> Large file support isn't select and i have also checked it with make
>  >> uclibc-menuconfig for uclibc.
>  >> The same problem happend with beaglebone_defconfig.
>  >>
>  >> After "make clean" and selecting "large file support" the build process
>  >> works.
>  >>
>  >> This problem doesn't happend with release 2012.08.
>  >>
>  >> Has anybody a hint for me ?
>
>  Willy> I have just had the same problem, is it possible that this is a
>  Willy> regression of the 2012.11 version ?
>
> I don't think so. I just did a:
>
> make at91sam9263ek_defconfig && make
>
> Without any problems. What exactly did you do?

make.

just make after having DL latest stable version few days ago from a
tgz. Doing a make menuconfig don't change anything, and as far as I
can remember, menuconfig was telling us about this problem (something
depending on largefile).

I know this has little sense, but before doing any configuration I
want to begin from a stable build, and test step by step when doing
configuration. I have an existing system that I want to replace by a
custom linux, so it's basically "copy/pasting" config. But I don't
believe doing all the config in one strike is realistic ^^.

(and BTW, hi all, I'm new with buildroot).

>
> --
> Bye, Peter Korsgaard
