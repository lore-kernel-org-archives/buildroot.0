From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Jun 2018 19:15:05 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <874lidcq8x.fsf@dell.be.48ers.dk>
References: <20180601180157.759-1-yann.morin.1998@free.fr>
 <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
 <20180605074932.668ae4e7@windsurf> <20180605152911.GB2503@scaer>
 <874lidcq8x.fsf@dell.be.48ers.dk>
Message-ID: <20180608171505.GB2090@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-06-08 16:22 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
[--SNIP--]
>  > As such, the only way is to depend on arm || armeb.
> Or alternatively on
> BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2

Right, this would have been more correct, bt, as you say:

> But ok, either of those are true for most ARM cores.

What ARM core does not have Thumb nowadays? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
