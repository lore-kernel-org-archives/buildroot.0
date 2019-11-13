From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 22:13:57 +0100
Subject: [Buildroot] [PATCH 00/11] Fix license incompatibility with
 readline
In-Reply-To: <20191113151724.12155-1-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
Message-ID: <20191113211357.GT3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> We have a number of packages where we (optionally) link with readline,
> even though the license of the package isn't compatible with the
> license of readline (GPL-3.0+), E.G. for packages licensed under
> GPL-2.0 only.
> 
> This series aims to fix that. I've tried to review the entire tree,
> and this is what I found:

Thanks a lot for doing this tedious work. Series mostly applied to
master now, except these two patches:

> kodi: fixed (GPL-2.0)
> neardal: fixed (GPL-2.0)

I'll reply (or have already replied) with more details to the individual
patches.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
