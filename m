From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 21:08:31 +0100
Subject: [Buildroot] [PATCH 2/8] Rename BR2_PREFER_STATIC_LIB to
 BR2_STATIC_LIBS
In-Reply-To: <20141211194906.2eff5d6f@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417642895-29606-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141211184400.GB4199@free.fr>
 <20141211194906.2eff5d6f@free-electrons.com>
Message-ID: <20141211200831.GF4199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-12-11 19:49 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Thu, 11 Dec 2014 19:44:00 +0100, Yann E. MORIN wrote:
> 
> > Otherwise I gues you atomated this bulk rename, so I only checked a few
> > packages, choosen randomly.
> 
> Yes, see the commit log:
> 
> """
> Note that we have verified that this commit can be reproduced by
> simply doing a global rename of BR2_PREFER_STATIC_LIB to
> BR2_STATIC_LIBS plus adding BR2_PREFER_STATIC_LIB to Config.in.legacy.
> """

Damned... :-)

So, when you respin an updated version of that patch:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
