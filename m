From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 May 2013 18:36:33 +0200
Subject: [Buildroot] [RFC/PATCH 0/4] support building from read-only
 source tree
In-Reply-To: <20130526144540.GA3380@free.fr>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
 <20130526144540.GA3380@free.fr>
Message-ID: <20130526163633.GB3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathan, All,

On 2013-05-26 16:45 +0200, Yann E. MORIN spake thusly:
> On 2012-06-18 10:02 -0500, Nathan Lynch spake thusly:
> > There are several places in Buildroot where files are copied from the
> > source tree to the output directory and then modified.  The most
> > obvious case is copying a .config or equivalent to the build
> > directory and then modifying it with sed, as with uClibc or busybox.
> 
> Unfortunately, those patches mostly no longer apply, since there have
> been some code churn (reoridering) in the meantime.
> 
> I'll take whatever I can, and adapt the remaining.

I've added them to my patchwork branch:
    https://www.gitorious.org/buildroot/buildroot/commits/yem-patchwork-fixes

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
