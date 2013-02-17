From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 00:34:22 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-misc
In-Reply-To: <cover.1360017945.git.yann.morin.1998@free.fr>
References: <cover.1360017945.git.yann.morin.1998@free.fr>
Message-ID: <201302180034.22557.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Monday 04 February 2013 Yann E. MORIN wrote:
> This series is a based on Richard's tzdata initial series, with some fixes
> discussed today during the Developper's Day.
> 
> Changes since Richard's post:
>   - install POSIX time zones only once
>   - path to 'zic' is exported by the 'zic' package
> 
> The following changes since commit d3e7fbd75e49e3368b8c361c45344266ceca5cfd:
> 
>   heirloom-mailx: needs fork() (2013-02-03 21:37:32 +0100)
> 
> are available in the git repository at:
>   git://gitorious.org/buildroot/buildroot.git yem-misc
> 
> Richard Braun (2):
>       package/zic: new host package
>       package/tzdata: new package

Ping? This is material for the 'next' branch, of course! ;-)

Not re-spinning this series, since it has not changed.
It's still in the patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
