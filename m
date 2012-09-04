From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Sep 2012 22:53:05 +0200
Subject: [Buildroot] [PATCH 2/4] New top-level directory: system
In-Reply-To: <bf2cdf7779649494ec8e4436a75c6d22b79d2a7b.1346767209.git.thomas.petazzoni@free-electrons.com>
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
 <bf2cdf7779649494ec8e4436a75c6d22b79d2a7b.1346767209.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201209042253.05822.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 04 September 2012 16:04:07 Thomas Petazzoni wrote:
> This directory groups the following elements:
>  * the default root filesystem skeleton
>  * the default device tables
>  * the Config.in options for system configuration (UART port for
>    getty, system hostname, etc.)
>  * the make rules to apply the system configuration options
> 
> Even though the skeleton and device tables could have lived in fs/, it
> would have been strange to have the UART, system hostname and other
> related options into fs/. A new system/ directory makes more sense.

Agreed. The fs/ sub-dir is now only for all the different rootfs methods.
I'm not too fond of the 'system' name, but I can see anything else that
would be fit.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

As this is a mostly-mechanical rename:
Acked-by: me

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
