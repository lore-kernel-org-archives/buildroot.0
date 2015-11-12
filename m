From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Nov 2015 18:35:57 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <87wptnods8.fsf@dell.be.48ers.dk>
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
 <20151111235359.707acc35@free-electrons.com>
 <20151111225820.GB3968@free.fr> <87wptnods8.fsf@dell.be.48ers.dk>
Message-ID: <20151112173556.GA4154@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-11-12 08:52 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  >> Those build failures are not caused by a 32 bits vs. 64 bits issue. In
>  >> fact, I started running my chroot under "linux32", but it was even
>  >> worse. Because indeed my chroots *are* 64 bits.
> 
>  > OK, but still, in a 32-bit chroot, in the linux32 personality, we were
>  > trying to use the 64-bit variant of the toolchain. And I observed the
>  > same symptom as the autobuild failures.
> 
> How can that be? With linux32 uname -m returns 'ix86', right?

Sorry, my bad. I meant: *without* the linux32 personality.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
