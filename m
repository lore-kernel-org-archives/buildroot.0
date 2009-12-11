From: Kieran Bingham <kieranbingham@gmail.com>
Date: Fri, 11 Dec 2009 10:09:50 +0000
Subject: [Buildroot] *Tons* of BR warnings
 like	"package/Makefile.autotools.in:179: warning: overriding	commands for
 target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
Message-ID: <4B221A6E.3090105@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> But I find that strange as I'm pretty sure I've successfully used Buildroot
> revisions after this commit before.
>
> I think it must be something wrong with *my* setup since nobody else has
> noticed this (and the commit is from July), but I don't know what it may be.
> Any suggestions?
>   

Actually I pulled Buildroot yesterday and also found this.

Perhaps its our environments ... I'm on ubuntu 9.10 Karmic ...
I don't think its a bash/dashism as I have /bin/sh -> /bin/bash ...

I hadn't got as far as looking at git bisect yet though ...
> Best regards,
> Bj?rn Forsman
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
