From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:09:55 +0100
Subject: [Buildroot] [PATCH 0/2] package/x11r7/{libxcb,
 xcb-proto}: use host-python3
In-Reply-To: <20210124105736.33533-1-titouanchristophe@gmail.com>
References: <20210124105736.33533-1-titouanchristophe@gmail.com>
Message-ID: <20210124160955.GE2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2021-01-24 11:57 +0100, Titouan Christophe spake thusly:
> Building these packages with Python3 seems to be supported upstream for a
> few years now, so we can remove two more host-python(2) dependencies here.
> 
> Titouan Christophe (2):
>   package/x11r7/xcb-proto: use host-python3 instead of host-python(2)
>   package/x11r7/libxcb: Use host-python3 instead of host-python(2)

Series of two applied to master, thanks.

I jsut reversed the order of the target vs. host variables; indeed we
tradiotionally define the host-related variables after the target ones.
Minor detail. ;-)

Thanks!

Regards,
Yann E. MORIN.

>  package/x11r7/libxcb/libxcb.mk       | 10 +++++-----
>  package/x11r7/xcb-proto/xcb-proto.mk |  8 ++++++--
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> -- 
> 2.25.3
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
