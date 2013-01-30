From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jan 2013 00:20:22 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <5109A2F6.5090106@mind.be>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <201301302343.22202.yann.morin.1998@free.fr> <5109A2F6.5090106@mind.be>
Message-ID: <201301310020.22800.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 30 January 2013 Arnout Vandecappelle wrote:
> On 30/01/13 23:43, Yann E. MORIN wrote:
> > What happens (eek! apply-patches.sh is hard to read) is that, if a patch
> > is neamd like a tarball, it is extracted in a temp dir, and that temp dir
> > is scanned as if it was passed as arg to apply-patches.sh:
> 
>   It's scanned recursively, even.
>   And it uses the series file, if present.

Yes.

> > So, yes, it works. Yet, I still find it a bit ugly (but less so than I
> > initially suspected). And it is not documented.
> > Should this be considered a feature? Can we rely on it?
> > If so, then I'll update the doc accordingly.
> 
>   I seem to remember that support for tar and a series file was added for 
> exactly this purpose.

It was part of the 'extensa directory overlay' support:
    ebb049593653f51475ca255445058a70a373fb62

>   In terms of ugliness: is there an alternative? Except not relying on 
> Debian patches, of course... I was going to say: you could try the Gentoo 
> version, but that one is actually using the Debian patches too :-)

Hey! I just said it was ugly. I never said it was not needed. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
