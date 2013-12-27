From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Dec 2013 14:14:09 +0100
Subject: [Buildroot] [PATCH] package: deprecate some more development
 tools
In-Reply-To: <1388145020-2082-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388145020-2082-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131227131409.GA4122@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-27 12:50 +0100, Thomas Petazzoni spake thusly:
> Since some time, we have removed the support to build a toolchain for
> the target, and therefore the support for several development tools on
> the target.
> 
> This commit deprecates a few additional development tools: m4, bison,
> flex and gob2. For flex, we retain the ability to build libfl, we only
> deprecated the ability to build the flex binary itself.
> 
> The original motivation for this patch is that m4 is causing build
> issues in some configurations, but there isn't really much incentive
> to fix this package for the target, since it is not really useful for
> embedded Linux systems.
> 
> Bison, Flex and Gob2 are deprecated because they are reverse
> dependencies of m4.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
