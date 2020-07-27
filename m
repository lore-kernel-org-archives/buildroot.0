From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 13:26:24 +0200
Subject: [Buildroot] [PATCH 0/2] package/libnss and libnspr version bump
In-Reply-To: <20200726005333.340972-1-giulio.benetti@benettiengineering.com>
References: <20200726005333.340972-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200727112624.GT19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2020-07-26 02:53 +0200, Giulio Benetti spake thusly:
> this patchset bump NSPR and NSS version. NSS 3.55 requires NSPR 4.27 so
> these 2 patches must be applied subsequently.
> 
> I've already built with utils/test-pkg -p libnss and the main 6 builds
> were OK.
> 
> Giulio Benetti (2):
>   package/libnspr: bump version to 4.27
>   package/libnss: bump version to 3.55

Both applied to master, thanks.

Regards,
Yann E. MORIN.

>  package/libnspr/libnspr.hash | 4 ++--
>  package/libnspr/libnspr.mk   | 2 +-
>  package/libnss/libnss.hash   | 4 ++--
>  package/libnss/libnss.mk     | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
