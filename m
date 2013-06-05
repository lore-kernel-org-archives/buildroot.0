From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jun 2013 22:38:03 +0200
Subject: [Buildroot] [PATCH] package/libbsd: depends on architectures
 providing a.out.h
In-Reply-To: <87li6ocri6.fsf@dell.be.48ers.dk>
References: <1370454724-10594-1-git-send-email-yann.morin.1998@free.fr>
 <87li6ocri6.fsf@dell.be.48ers.dk>
Message-ID: <20130605203803.GE3185@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-06-05 21:00 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> libbsd requires a.out.h, which is only available in a select subset
>  Yann> of the architectures Buildroot supports.
> 
>  Yann> This means libedit can no longer 'select' libbsd, so turn the 'select'
>  Yann> into a 'depends on'. And the dependency chain ends there.
> 
> Why? You can just propagate the arch dependencies to libedit as well.

Sure, will do.

> I don't like dependencies for libraries, it isn't obvious to people that
> we actually have a libedit package.

I don't like propagating the dependencies. ;-)

I wonder if I should revive the _AVAILABLE stuff from last year? But
that's for another thread.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
