From: Alexander Khryukin <alexander@mezon.ru>
Date: Mon, 5 Nov 2012 12:19:40 +0300
Subject: [Buildroot] new perl build issue
In-Reply-To: <CABtOAfyXrgHyg2ggDJvYXExhU4RMabsOVRXfAkE0p9+bnGVrZg@mail.gmail.com>
References: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
 <CAB0FRstkx1+Eg0WTv4eVJ+KPFX9RY2C8X4SaL0EDoBK0P642SQ@mail.gmail.com>
 <20121105075317.75f9f85c@skate>
 <CABtOAfyXrgHyg2ggDJvYXExhU4RMabsOVRXfAkE0p9+bnGVrZg@mail.gmail.com>
Message-ID: <CABtOAfy84BF1p_KZ2m3sqr-o72xuj_TL1eZfQj-BsH5Z+kmnWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/5 Alexander Khryukin <alexander@mezon.ru>

>
>
> 2012/11/5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>>
>> On Sun, 4 Nov 2012 20:41:45 +0100, Fran?ois Perrad wrote:
>>
>> > this afternoon, Thomas has posted 3 patches for qemu (see
>> > http://patchwork.ozlabs.org/patch/197055/).
>> > Alexander, try to rebuild host-qemu with them.
>>
>> Unfortunately, none of those patches have a chance to fix Alexander's
>> problem. My patches only fix missing dependencies.
>>
>> Also, could you have a look at http://autobuild.buildroot.org/ for perl
>> build failures? It seems like Qemu doesn't start properly on some
>> platforms, for some reason.
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>>
>
>
> I applied your patch but looks it not helps me.
>
> http://pastie.org/5188031
>


Also if i compile it by my default system gcc it's ok


[fdkit at kvm-host UU]$ gcc try.c
[fdkit at kvm-host UU]$ ls ./a.out
./a.out*
[fdkit at kvm-host UU]$ ./a.out
Ok
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121105/6b672048/attachment.html>
