From: Willy Lambert <lambert.willy@gmail.com>
Date: Tue, 11 Dec 2012 09:43:48 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <87lid5oyr5.fsf@dell.be.48ers.dk>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <87pq2hpnpq.fsf@dell.be.48ers.dk>
 <CAKvQZ_3P_nfpGsC+V6Z_eRjsmNssV-Pq0EDp0v78hfkY4vwdqg@mail.gmail.com>
 <87lid5oyr5.fsf@dell.be.48ers.dk>
Message-ID: <CAKvQZ_2ghfJ-k2XaNEH4cP7jsr--pUjV4TNGXCY-T3aZCm2Vig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/11 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:
>
>  Willy> Yes, so I just quit it so it leaves the default config (which
>  Willy> seems to have a problem with large file)
>  >>
>  >> Ok, that also works here:
>  >>
>  >> yes '' | make oldconfig
>  >> make
>
> Does that work for you?
>
>  >> Notice that we have a bunch of preconfigured qemu defconfigs (look in
>  >> configs/)
>  >>
>
>  Willy> thanks for this tips I overlooked that. I'm on a x86 atom so
>  Willy> there is little config to preset.
>
> Is your build machine an atom? If so, beware that your build times are
> going to be quite long. Don't you have access to any faster machines?
>

Sorry, I was not clear. My *target* is an atom N450 on a PCM-3362
Advantech board :
http://www.advantech.com/products/PCM-3362/mod_2B69DA4C-D506-4AEA-8CC3-F6E58E3CBC87.aspx
If by chance anyone here has worked on this...

My build machine is a quad i5, a bit overclocked, the compilation time
is reasonable.

But for time being I'm just trying to compile a "default" buildroot
and run in into qemu.
(btw I have difficulties to put my RFS, in tgz format (cause it's the
default) into a .img file, is there any Buildroot hints for this, or
should I switch to other "RFS  image output format")

> --
> Bye, Peter Korsgaard
