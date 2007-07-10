From: Sonrier Romary <romary.sonrier@free.fr>
Date: Tue, 10 Jul 2007 16:10:03 +0200
Subject: [Buildroot] trouble with building openssh in svn version 19003
In-Reply-To: <5d75f4610707051114n74862bet4ccddac2f35a163b@mail.gmail.com>
References: <5d75f4610707051114n74862bet4ccddac2f35a163b@mail.gmail.com>
Message-ID: <4693933B.3040002@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have the same issue, i just can't build openssh in buildroot revision 
19057,

Does someone has solved this bug? i didn't see any bug corresponding to 
that issue in mantis,
should i create one?

Anyway , does someone has any idea about this bug?

Regards,

Romary Sonrier


BuraphaLinux Server a ?crit :
> Hello,
>
>     While attempting to build openssh in buildroot subversion version 19003
> I get this at the end of the build attempt for openssh:
>
> scp.o: In function `bwlimit':
> scp.c:(.text+0x420): undefined reference to `__fixunsdfdi'
> scp.c:(.text+0x435): undefined reference to `__udivdi3'
> scp.c:(.text+0x44e): undefined reference to `__umoddi3'
> make[1]: *** [scp] Error 1
>
> Are other people seeing this when they try this on pentium 4 systems?
> Is this a problem with compiler flags, or is it just some functions that
> are not included with uClibc?  Should I make a patch that just avoids
> building scp?  sftp still seems to build and can do the same kinds of
> file transfers, but not as neatly in scripts.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
