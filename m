From: =?UTF-8?Q?Zden=C4=9Bk_Materna?= <zdenek.materna@gmail.com>
Date: Tue, 1 Mar 2011 09:03:28 +0100
Subject: [Buildroot] Nanosleep hangs
In-Reply-To: <AANLkTik0PKyS+8tQfbA-yp2iqhzY6ScAiNQxXgh3ZeR8@mail.gmail.com>
References: <AANLkTik0PKyS+8tQfbA-yp2iqhzY6ScAiNQxXgh3ZeR8@mail.gmail.com>
Message-ID: <AANLkTik_5Fsg8CnyH1mFwRBbY0uxWdDONrxo5Wa5nN=L@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dne 28. ?nora 2011 20:06 Zden?k Materna <zdenek.materna@gmail.com> napsal(a):
> Hello,
>
> I would like to ask - is there any issue with nanosleep function?
> Clock_nanosleep is
> unimplemented in uClibc (right?) so I planed to use nanosleep instead
> of it. But it doesn't work for me - program hangs on it forever.
> Usleep works, but it's not good alternative, isn't it? I'm also going
> to utilize timers - are there any issues about them? However google
> didn't give me much useful answers. I tried it with uClibc 0.9.31 and
> 0.9.32-rc2 (snapshot version didn't compile).
>
> I'm sorry for cross posting - originally posted to uclibc mailing list
> but without any
> response. Thanks for any advice and sorry for poor English.
>
> My environment: uClibc 0.9.32-rc2, ARM (AT91SAM9260), kernel 2.6.33.7
> (with RT path and hi-res timers enabled).
>
> Best regards,
> Zdenek Materna
>

Hello,

problem with nanosleep solved - it was between chair and keyboard. As usually...

Best regards
Zdenek Materna
