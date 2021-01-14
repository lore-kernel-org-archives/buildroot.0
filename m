From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jan 2021 22:33:23 +0100
Subject: [Buildroot] [PATCH 0/2] Add support for an RCW on sl28 boards
In-Reply-To: <20210112105154.31531-1-michael@walle.cc>
References: <20210112105154.31531-1-michael@walle.cc>
Message-ID: <20210114213323.GC2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2021-01-12 11:51 +0100, Michael Walle spake thusly:
> Add a new package for the RCW and then use it on the sl28 board to
> integrate it into the target image.
> 
> Michael Walle (2):
>   package/rcw-smarc-sal28: new package
>   configs/kontron_smarc_sal28: integrate RCW into rootfs image

Both applied to master, thanks.

Regards,
Yann E. MORIN.

>  DEVELOPERS                                   |  1 +
>  board/kontron/smarc-sal28/genimage.cfg       |  6 ++++
>  configs/kontron_smarc_sal28_defconfig        |  1 +
>  package/Config.in                            |  1 +
>  package/rcw-smarc-sal28/Config.in            | 25 +++++++++++++
>  package/rcw-smarc-sal28/rcw-smarc-sal28.hash |  3 ++
>  package/rcw-smarc-sal28/rcw-smarc-sal28.mk   | 37 ++++++++++++++++++++
>  7 files changed, 74 insertions(+)
>  create mode 100644 package/rcw-smarc-sal28/Config.in
>  create mode 100644 package/rcw-smarc-sal28/rcw-smarc-sal28.hash
>  create mode 100644 package/rcw-smarc-sal28/rcw-smarc-sal28.mk
> 
> -- 
> 2.20.1
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
