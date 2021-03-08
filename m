From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 23:54:04 +0100
Subject: [Buildroot] [PATCH 0/2] package/sysklogd: adopt and bump to
 version 2.2.2
In-Reply-To: <20210308132742.4022471-1-troglobit@gmail.com>
References: <20210308132742.4022471-1-troglobit@gmail.com>
Message-ID: <20210308225404.GI2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-03-08 14:27 +0100, Joachim Wiberg spake thusly:
> this bump of sysklogd fixes a rather ugly bug in parsing the timestamp
> of kernel log messages.  The regression comes from moving from the old
> /proc/kmsg interface to the modern /dev/kmsg dito.  So Peter might be
> interested in cherry-picking this to 2021.02.x
> 
> Best regards
>  /Joachim
> 
> Joachim Wiberg (2):
>   package/sysklogd: bump to version 2.2.2
>   DEVELOPERS: adopt package/sysklogd

Applied to master, thanks.

Peter, you may cherry-pick b5c5a1d49d into 2021.02, as it is a bug fix.
9efacd4697 is an update to DEVELOPPERS, and I think you should also
cherry-pick it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
