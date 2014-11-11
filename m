From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 13:52:39 +0100
Subject: [Buildroot] [PATCH v2 01/15] package/pkg-autotools.mk:
 Factorize hooks.
In-Reply-To: <20141110221323.GF22119@free.fr>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-2-git-send-email-johan.oudinet@gmail.com>
 <20141110221323.GF22119@free.fr>
Message-ID: <20141111125239.GF4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

johan, All,

On 2014-11-10 23:13 +0100, Yann E. MORIN spake thusly:
> On 2014-11-07 14:28 +0100, Johan Oudinet spake thusly:
> > Define common macros only once (instead of as many times as
> > there are inner-autotools-package calls).
> > Factorize LIBTOOL_PATCH_HOOK and AUTORECONF_HOOK to avoid duplicated
> > code.
[--SNIP--]
> I'll do some more in-depth review later, presumably after you split the
> patch. If you don;t have time for that, I can see to get it done
> tomorrow.

So, are you working on this, or can I go hacking this?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
