From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 23 Jul 2010 00:05:22 +0200
Subject: [Buildroot] build of gcc 4.3.5 broken with
	BR2_GCC_USE_SJLJ_EXCEPTIONS
In-Reply-To: <4C48BF3D.4040301@gmx.net>
References: <4C48BF3D.4040301@gmx.net>
Message-ID: <201007230005.22462.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus, All,

On Thursday 22 July 2010 23:59:25 Ossy wrote:
> I don't need this particular option (BR2_GCC_USE_SJLJ_EXCEPTIONS) but 
> anyway my buildroot version (current git tree) wasn't able to build 
> 4.3.5-final with BR2_GCC_USE_SJLJ_EXCEPTIONS=y. After deactivating it 
> everything was fine again.

Yes, it happens too for me with armeb. Other archs are fine for me with
sjlj enabled.

I did not dig up why, so I /simply/ turn off sjlj for ermeb.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
