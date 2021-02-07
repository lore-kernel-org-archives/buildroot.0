From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Feb 2021 14:17:23 +0100
Subject: [Buildroot] [PATCH] package/plg-utils: escape \ in generated
 legal-info
In-Reply-To: <87czxcysud.fsf@dell.be.48ers.dk>
References: <20210206085102.1017439-1-yann.morin.1998@free.fr>
 <87sg681aq7.fsf@dell.be.48ers.dk> <20210207112831.GK2384@scaer>
 <87czxcysud.fsf@dell.be.48ers.dk>
Message-ID: <20210207131723.GL2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-07 13:18 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> Perhaps we should add a gitlab test to verify that we generate valid
>  >> json, E.G. by piping it to jq (or similar).
>  > Yeah, I'm working on it... But we can't do that in gitlab, because the
>  > output of show-info depends on the selected packages, so it would have
>  > to be done in the autobuilders.
> But that then requires jq on the autobuilder. Can't we just do a 'make
> allyespackageconfig' in gitlab?

We don't have jq in our current base image either... We can push a new
image, though.

As for the autobuilders, we can build host-jq...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
