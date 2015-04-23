From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Apr 2015 18:44:18 +0200
Subject: [Buildroot] [PATCH] pkg-cmake: Skip compilation in installation
 step
In-Reply-To: <a2783e293d15e178b037127dd09d0386@openmailbox.org>
References: <1429733516-4466-1-git-send-email-cedric.marie@openmailbox.org>
 <20150423095021.16ba5083@free-electrons.com>
 <a2783e293d15e178b037127dd09d0386@openmailbox.org>
Message-ID: <20150423164418.GB4255@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

C?dric, All,

On 2015-04-23 11:06 +0200, C?dric Marie spake thusly:
> Le 2015-04-23 09:50, Thomas Petazzoni a ?crit?:
> >Applied, thanks.
> 
> Thank you.
> Should I provide the patch for host-cmake as well?

Yes, please. :-)

Even if the gain in time is not that important, I guess it is good to
use the same trick everywhere cmake is used.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
