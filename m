From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 23:26:37 +0200
Subject: [Buildroot] [PATCH 0/9] Fix binutils bug 21464 and remove it
In-Reply-To: <62032574-bad4-5d93-fc72-4d3b455fe899@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
 <8db63dbe-1abb-3fbf-59c6-6cb14fde577c@mind.be>
 <62032574-bad4-5d93-fc72-4d3b455fe899@benettiengineering.com>
Message-ID: <20210521212637.GX3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, Arnout, All,

On 2021-05-21 16:21 +0200, Giulio Benetti spake thusly:
> On 5/21/21 10:46 AM, Arnout Vandecappelle wrote:
> >On 03/05/2021 13:13, Giulio Benetti wrote:
> >>   toolchain: remove binutils bug 21464
> >>   package/libgeos: remove binutils bug 21464 dependency
> >>   package/postgis: remove libgeos binutils bug 21464 inheritance
> >>   package/protobuf: remove binutils bug 21464 dependency
> >  These four should be squashed into a single patch.
> I've just sent a v2 for this:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210521140942.3032331-1-giulio.benetti at benettiengineering.com/

As a consequence, I've marked the original 4 as supersded in Patchwork,
which only leaves the remaining two:

    package/libgeos: fix build failure due to missing -mcmodel=large
    package/protobuf: fix build failure due to missing -mcmodel=large 

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
