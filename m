From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Nov 2015 23:53:34 +0100
Subject: [Buildroot] Buildroot defconfigs now being built on Travis CI
In-Reply-To: <87r3jfyq7c.fsf@dell.be.48ers.dk>
References: <20151123223332.3eff11d8@free-electrons.com>
 <874mgc4c6f.fsf@dell.be.48ers.dk>
 <20151124185221.16a4b432@free-electrons.com>
 <87d1uz15n2.fsf@dell.be.48ers.dk> <20151124223758.GB3904@free.fr>
 <87r3jfyq7c.fsf@dell.be.48ers.dk>
Message-ID: <20151124225334.GD3904@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-11-24 23:42 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> >> Probably it is, I just saw that you were copying them to the
>  >> autobuilders.
>  > Thomas did that so we could try to reproduce locally. Since it was
>  > working on our machines, we hunted a difference on the host. And
>  > suddenly, XFS... :-/
> Heh ;) Any ideas about how to fix it for real? I think I saw a reference
> on IRC to something in e2fsprogs to generate images?

The ideal solution would be that e2fsprogs do a new major release: there
is no in their master branch suport for mkfs.ext2 to behave like
genext2fs and populate the filesystem with the content of a diectory.

But it's only in their master, and there no release with that yet, even
though they've had that for 1.5 years now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
