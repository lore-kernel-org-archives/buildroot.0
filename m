From: Fathi Boudra <fboudra@gmail.com>
Date: Mon, 22 Sep 2008 16:43:13 +0200
Subject: [Buildroot] broken build rootfs workflow
In-Reply-To: <87iqssyyxh.fsf@macbook.be.48ers.dk>
References: <6a2e33620809180148i7f4c3829jb7857a8adf90bcfa@mail.gmail.com>
	<6a2e33620809180253t4b32032eu399ab6734076f367@mail.gmail.com>
	<87iqssyyxh.fsf@macbook.be.48ers.dk>
Message-ID: <6a2e33620809220743m4a0d01b2gfabedc6bc9c6cc99@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Fathi> My configuration file is copied properly, then a bunch of sed
>  Fathi> commands modify it inside .oldconfig ???  I guess if I provide
>  Fathi> my own configuration file, I don't want my file modified by
>  Fathi> random sed commands ?
>
> Well, it has to do that as quite some packages needs to know if those
> features are enabled or not - Please just configure buildroot (under
> toolchain) to match what you want.
>


what about use case that require uClibc or busybox configuration changes ?

Maybe a rule to use provided configurations files without changes is needed
?

cheers,

Fathi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080922/254d2551/attachment.htm 
