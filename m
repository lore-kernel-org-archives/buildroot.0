From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Mon, 19 Mar 2012 11:56:02 +0100
Subject: [Buildroot] [PATCH] vnstat: new package
In-Reply-To: <878viwkgv9.fsf@macbook.be.48ers.dk>
References: <1332150485-22293-1-git-send-email-alvaro.gamez@hazent.com>
 <20120319105120.7dcafd10@skate>
 <CAM+bi4tyqL-zYyb7AC7kRPgGvedUoHok=Vkn-xdHJuZbs-PyGw@mail.gmail.com>
 <20120319112026.592985ee@skate>
 <CAM+bi4tg=4ywjQYrWDP7_zQ_fvUzCYFpySjz-siZKFhwNYJwVw@mail.gmail.com>
 <878viwkgv9.fsf@macbook.be.48ers.dk>
Message-ID: <CAM+bi4uPB2C59UhFp-FSHHzjD5sN1-XZfxeUdAUNbvhJBiKtog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok! I'm getting it now.

I remember a conversation a few days ago, and I think it was decided to no
longer set the clean and uninstall targets, am I right? If that's the case,
then the lines from Thomas should be enough, is that right?

I'm going to test all that, thank you again!

2012/3/19 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Alvaro" == Alvaro Gamez <alvaro.gamez@hazent.com> writes:
>
>  Alvaro> Ah, that's better! The package I was looking at as reference is
>  Alvaro> ezxml and is much more repetitive.
>
> That's because ezxml's makefile doesn't have a usable install target. If
> vnstat has, then you can just call it.
>
> --
> Bye, Peter Korsgaard
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120319/911f009d/attachment.html>
