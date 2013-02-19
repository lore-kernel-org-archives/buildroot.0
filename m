From: Gregory Perry <Gregory.Perry@govirtual.tv>
Date: Tue, 19 Feb 2013 21:04:44 +0000
Subject: [Buildroot] SSHFS userland support
In-Reply-To: <201302192130.29112.yann.morin.1998@free.fr>
References: <718DFA7882181D45B8BD18F31C46D55427A6A7E0@MBX204.domain.local>,
 <201302192130.29112.yann.morin.1998@free.fr>
Message-ID: <718DFA7882181D45B8BD18F31C46D55427A6A846@MBX204.domain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>________________________________________
>From: Yann E. MORIN [yann.morin.1998 at gmail.com] on behalf of Yann E. MORIN [yann.morin.1998 at free.fr]
>Sent: Tuesday, February 19, 2013 3:30 PM
>To: buildroot at busybox.net
>Cc: Gregory Perry
>Subject: Re: [Buildroot] SSHFS userland support
>
>Gregory, All,
>
>[Please, wrap your lines at ~78 columns, reading wider columns is not easy]
>
>On Tuesday 19 February 2013 Gregory Perry wrote:
>> I am doing a buildroot integration for an i386 target but I can't for
>> the life of me figure out how to include SSHFS userland support (the
>> SSHFS binary itself.  I've selected the FUSE filesystem dependencies
>> as well as support for OpenSSH, but the sshfs binary needed to
>> instantiate an SSH/FUSE connection is not present in the target.
>
>sshfs is provided by separate package:
>
>    Package Selection for the target  --->
>        Filesystem and flash utilities  --->
>            [ ] sshfs (FUSE)
>
>Regards,
>Yann E. MORIN.
>
>--
>.-----------------.--------------------.------------------.--------------------.
>|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>'------------------------------^-------^------------------^--------------------'

Thanks Yann.

Using the most recent buildroot-stable, there is no sshfs option under that
menu, only a squashfs option.  But what's weird about it, directly under
the squashfs option is a "*** sshfs requires a toolchain..." message.  Maybe
there is a typo/bug with the most recent buildroot-stable?  Or do I not have
the right FUSE dependencies selected elsewhere?

Thanks in advance
