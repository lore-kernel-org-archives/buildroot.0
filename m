From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 9 Aug 2011 21:40:21 +0200
Subject: [Buildroot] linphone package
In-Reply-To: <87r54uie0h.fsf@macbook.be.48ers.dk>
References: <4E413EB9.6040504@fosstel.com>
 <201108092056.40244.yann.morin.1998@anciens.enib.fr>
 <87r54uie0h.fsf@macbook.be.48ers.dk>
Message-ID: <201108092140.21886.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Tuesday 09 August 2011 21:25:02 Peter Korsgaard wrote:
>  Yann> Maybe it would make sense to add this to the auto-target infrastructure?
>  Yann> Either it is unconditionally added, or the package can set a variable to
>  Yann> use it, eg. PKG_CONF_PROG_PREFIX = YES
> 
> Unconditional should be ok, similar to how we do the ipv6 / nls stuff.

OK.

I'm also removing it from PKG_CONF_OPT variables. Do you want a single patch
that removes all instances in one go, or do you want one patch per package?
I'm tempted to do the latter, so we can revert only those that break.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
