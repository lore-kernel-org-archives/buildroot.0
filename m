From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 00:02:01 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207225408.GC24430@vapier.lan>
References: <20151202073542.GY23754@vapier.lan> <20151206214229.GE4023@free.fr>
 <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
 <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan>
 <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan>
 <87egexoqf4.fsf@dell.be.48ers.dk>
 <20151207225408.GC24430@vapier.lan>
Message-ID: <20151207230201.GG14874@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On 2015-12-07 17:54 -0500, Mike Frysinger spake thusly:
> we're already at (3).  even if we weren't, i don't see how transitioning
> would affect the SNI issue.  the question is simple: how long do you want
> to (try to) support old systems where people refuse to fix their setup ?
> we're talking about systems that are over three years old (wget-1.14 was
> released in Aug 2012).  what is your cut off ?  3 years ?  4 years ?

A lot of companies are still using RHEL5, which was released in 2007.

Yes, that's old. But once an enterprise has settled on their "production
environment", it lasts years, up to the decade or more. Yes, we are
still trying to have Buildroot work in such an old environment...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
