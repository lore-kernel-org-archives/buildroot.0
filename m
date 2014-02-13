From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Feb 2014 22:38:39 +0100
Subject: [Buildroot] [PATCH 2/2] nut: disable parallel builds
In-Reply-To: <1392326275-25992-2-git-send-email-romain.naour@openwide.fr>
References: <1392326275-25992-1-git-send-email-romain.naour@openwide.fr>
 <1392326275-25992-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140213213839.GB3259@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-02-13 22:17 +0100, Romain Naour spake thusly:
> The build system has a race condition causing build failure,
> so ensure make -j1 is used.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0dd/0ddd856bcbec2db0500791fd428ba053d6e4fa1b/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

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
