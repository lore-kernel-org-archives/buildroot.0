From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 8 May 2008 06:40:50 -0700
Subject: [Buildroot] Bash patches not working? (bash32-025 and up)
In-Reply-To: <1210225844.4822.143.camel@nigel-x60>
References: <326f33790805071819n32858557o187314db62ce5b26@mail.gmail.com>
	<1210223891.4822.142.camel@nigel-x60>
	<326f33790805072238s6eff6e3em9d789b1f57e598a0@mail.gmail.com>
	<1210225844.4822.143.camel@nigel-x60>
Message-ID: <326f33790805080640g6f9b4c6av67b884767fea397@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems I am still running into the same problem. I removed bash-3.2 and
ran make, but found the same error, so I did a make clean first then built
again, and I see the same error. Even the bash-3.2 folder appears again. Is
there something else? A setting within buildroot's menuconfig perhaps?

On Wed, May 7, 2008 at 10:50 PM, Nigel Kukard <nkukard@lbsd.net> wrote:

>
> > Are you suggesting that I remove the ~/buildroot/build_arm/bash-3.2
> > directory?
>
> Yep.
>
> -N
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080508/6a5d0373/attachment.htm 
