From: Mark Constable <markc@renta.net>
Date: Fri, 23 Oct 2009 14:03:39 +1000
Subject: [Buildroot] perl depends miniperl
In-Reply-To: <87hbtrnpcu.fsf@macbook.be.48ers.dk>
References: <4AE07A68.8090403@renta.net> <87hbtrnpcu.fsf@macbook.be.48ers.dk>
Message-ID: <4AE12B1B.8000206@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> For an ar with write support, you probably need binutils/gcc on the
> target.

Yes, Ive been trying for that for a couple of days now :-)

>  Mark> -> Generic development system and see what happens but it stopped
>  Mark> at this point where, I presume, building perl requires
>  Mark> ../../miniperl.
> 
> Our perl is miniperl, so there must be something broken in the miniperl
> package.

I wish I could submit a fix but I think it'll take me months to
get a good handle on buildroot and the use of Makefiles.

>  Mark> I really do not want perl at all. Certainly not on the target.
> 
> Then don't enable it ;)

Unfortunately (for me) selecting the general devel install auto
selects autoconf which in turn auto selects miniperl.

And from the error it seems like it's only needed for error.pm!
(I'm not sure what that means but it might be fairly trivial and
easy to substitute, perhaps)

--markc
