From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 9 Dec 2010 19:42:17 +0100
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <20101209122657.12946lktv4rsa84k@www.home.zuerker.org>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>
	<4D0112E5.301@zacarias.com.ar>
	<20101209122657.12946lktv4rsa84k@www.home.zuerker.org>
Message-ID: <201012091942.18191.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On Thursday 09 December 2010 19:26:57 Heiko Zuerker wrote:
> It now blows up because it can't find xtables.h. Seems like the  
> external toolchain (ct-ng 1.9.0) didn't include that from the kernel.
> I'll do some more testing on it.

xtables.h does not exist in linux-2.6.36, so it can not be installed. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
