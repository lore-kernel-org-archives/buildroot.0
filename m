From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jan 2021 18:30:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-01-15
In-Reply-To: <PA4PR04MB7920C4990EEA59953B4C3C4DA7A40@PA4PR04MB7920.eurprd04.prod.outlook.com>
References: <6fdd08ad-8de6-464b-a7b2-47c9cbedad77@HE1EUR01FT006.eop-EUR01.prod.protection.outlook.com>
 <PA4PR04MB7920C4990EEA59953B4C3C4DA7A40@PA4PR04MB7920.eurprd04.prod.outlook.com>
Message-ID: <20210118173019.GW2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-01-18 10:26 +0000, Stephane Viau (OSS) spake thusly:
> Today, none of the freescale_imx* defconfig build on master.
>
> A git bisect blames commit 5b95a5dc2 ("support/download: change format of
> archives generated from git"), introduced by Yann on January 10th.

Oh damn. I did not even think about testing the defconfigs during that
conversion.

Grrr... I'm stupid...

> Any idea whether someone is looking into these failures?

I will be looking into that, yes. Thanks for reporting.

Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
