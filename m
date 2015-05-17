From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 17 May 2015 23:12:02 +0200
Subject: [Buildroot] [PATCH] package.mnono: fix install with parallel
	builds
In-Reply-To: <87twvc8b4x.fsf@dell.be.48ers.dk>
References: <1431797495-6157-1-git-send-email-yann.morin.1998@free.fr>
 <87twvc8b4x.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VkJ0x6mUKig6TPQb3SOKHEzqqQzCtw86wsQskzXKOOO1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN

2015-05-16 23:29 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > Due to a race in the 'install' utility, installing the same file twice
>  > in parallel often results in one of the install calls to fail.
>
>  > Ensure proper ordering of conflicting rules.
>
> Committed with the typo in $SUBJECT fixed, thanks.

A big thank you for fixing this nasty bug, I really haven't no time to
investigate deeply. A really and appreciated big thank you!

Sincerely, Angelo

>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
