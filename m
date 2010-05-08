From: Bart Otten <bartotten@gmail.com>
Date: Sat, 8 May 2010 16:09:47 +0200
Subject: [Buildroot] Mplayer
In-Reply-To: <87aasa7g4r.fsf@macbook.be.48ers.dk>
References: <w2w76d09b281004291240oe35449fdz226a42e12a5097a0@mail.gmail.com>
	<4BD9E3BF.8080106@gmail.com> <8739y4agy8.fsf@macbook.be.48ers.dk>
	<AANLkTimwzzNwDOF4mOhtPDzOCvtSe9-MVpmrZHvBFveR@mail.gmail.com>
	<87aasa7g4r.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikHUmI1rc-PHN-_DswuxT3RfnvP2G5p9FU5nS6r@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/5/8 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Bart" == Bart Otten <bartotten@gmail.com> writes:
>
> Please send BR mails to the buildroot list, and not only to me.
>
>  Peter> The problem above seems to be that it somehow end up using host
> headers
>  Peter> (/usr/X11/) - Could you post your mplayer configure.log?
>
>  Peter> The /usr/X11 btw looks a bit odd - What distribution is this?
>
>  Bart> I have Slackware
>
>  Bart> ============ Checking for X11 headers presence ============
>  Bart> Result is: yes (using /usr/X11/include)
>
> So that seems to be the problem. Could you try adding --disable-x11 to
> the other --disable- lines in package/multimedia/mplayer/mplayer.mk?
>
> --
> Bye, Peter Korsgaard
>


ass_render.c:(.text+0x3862): undefined reference to `__assert_fail'
libass/libass.a(ass_bitmap.o):ass_bitmap.c:(.text+0x24d): more undefined
references to `__assert_fail' follow
collect2: ld returned 1 exit status
make[1]: *** [mplayer] Error 1
make[1]: Leaving directory
`/home/Bart/buildroot-2010.05-rc1/output/build/MPlayer-1.0rc2'
make: ***
[/home/Bart/buildroot-2010.05-rc1/output/build/MPlayer-1.0rc2/mplayer] Error
2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100508/4b457ced/attachment.htm>
