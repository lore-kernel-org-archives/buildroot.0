From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Jul 2013 22:14:00 +0200
Subject: [Buildroot] [RFC 2/3] sunxi-mali: new package
In-Reply-To: <1373778632-16531-3-git-send-email-spenser@gillilanding.com>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
 <1373778632-16531-3-git-send-email-spenser@gillilanding.com>
Message-ID: <20130716201400.GA7947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spenser, All,

On 2013-07-14 00:10 -0500, Spenser Gilliland spake thusly:
> +config BR2_PACKAGE_SUNXI_MALI
> +	bool "sunxi-mali"

Do you plan on looking to the open source driver, lima, as an
alternative to mali?

http://limadriver.org/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
