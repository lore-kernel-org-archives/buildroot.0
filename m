From: Willy Lambert <lambert.willy@gmail.com>
Date: Fri, 18 Jan 2013 11:47:59 +0100
Subject: [Buildroot] linux vs android
In-Reply-To: <1358502642.13309.YahooMailNeo@web164603.mail.gq1.yahoo.com>
References: <1358502642.13309.YahooMailNeo@web164603.mail.gq1.yahoo.com>
Message-ID: <CAKvQZ_0eWp4rOr+FJ_EK6=y4SoAQ5o0qk=8hwNaSaKny0B6t_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/1/18 Zoran Djordjevic <djdjdjole@yahoo.com>:
> Helo
>
> I don't know if this forum is for question like this. My field of interest
> is
> related to embedded devices (ARM type). Moderate graphics and ordinary
> communication (TCP mostly). Alhough I was using Buildroot for building RFS,
> and
> so- using Linux as the basis for programming, I now start to ask myself, why
> should I stick to Linux, when most of embedded devices have possibility to
> install Android image also. I see also that versions after 3.something, have
> also USB host API, which extends their use.
> Also consider Android to be much easier for programming, although someone
> may argue that assesment.
>
> Regards

What Buildroot does is describe here : http://buildroot.uclibc.org/ on
the main page. It aims at creating Linux root filesystem from scratch
(it is especially usefull when you want to restrict linux to its
minimal to fit low cost hardware, but it is not the only use case). In
a way it also helps you managing precisely what will be embedded on
the target.

I have no experience with Android so I can say anything.

I'm just a simple user, but I think it's not the right place to ask.
If you choose to go with linux after some discussions elsewher), and
wonder about how you manage to do it, then it will be the right place.

>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
