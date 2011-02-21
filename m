From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 22 Feb 2011 00:31:45 +0100
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <AANLkTimV0Nybt66tdbEJVQrZxB0oV_Uzb-1AqHKo2eej@mail.gmail.com>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
	<20110221234207.53607d77@surf>
	<AANLkTimV0Nybt66tdbEJVQrZxB0oV_Uzb-1AqHKo2eej@mail.gmail.com>
Message-ID: <201102220031.46111.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, Thomas, All,

On Tuesday 22 February 2011 00:12:23 Charles Krinke wrote:
> I did look at the dotconfig and I can see that CONFIG_MTD=y and
> CONFIG_MTD_PARTITIONS=y are both defined.

As you are passing the partition table on the kernel command line, you will
also need to set CONFIG_MTD_CMDLINE_PARTS=y or the kernel will not parse it.

Wild guess... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
