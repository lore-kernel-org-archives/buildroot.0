From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 09:59:06 +0100
Subject: [Buildroot] [PATCH 0/2] package/libnss: bump version
In-Reply-To: <20210321075931.3404471-1-giulio.benetti@benettiengineering.com>
References: <20210321075931.3404471-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210321085906.GX3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-03-21 08:59 +0100, Giulio Benetti spake thusly:
> This patchset update libnss version as well as libnspr version because
> NSS 3.63 requires NSPR 4.30
> 
> Giulio Benetti (2):
>   package/libnspr: bump version to 4.30
>   package/libnss: bump version to 3.63

Series of two applied to master, thanks.

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
