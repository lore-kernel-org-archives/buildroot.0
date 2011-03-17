From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 17 Mar 2011 23:06:10 +0100
Subject: [Buildroot] glibc vs uclibc
In-Reply-To: <AANLkTinOm7WaxyMSmZtXpbsLNy1Mnk0h3WdjatQsOV2S@mail.gmail.com>
References: <AANLkTinGzTxniNjkHfkpGLngJ_Y7ie+B4PiFUcrLDc-u@mail.gmail.com>
	<AANLkTimCeg_s5o7th-20cd77045CVrRAFowKwt8COXLa@mail.gmail.com>
	<AANLkTinOm7WaxyMSmZtXpbsLNy1Mnk0h3WdjatQsOV2S@mail.gmail.com>
Message-ID: <201103172306.10380.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On Thursday 17 March 2011 22:57:42 Charles Krinke wrote:
> I'm sorry, I don't understand. Can you give me a few details on 'how one
> builds a root filesystsm with glibc instead of uclibc, please?

You have to use an external toolchain.

First, either build your own toolchain, or get a pre-built one.

Second, configure buildroot to use that toolchain. In menuconfig:
  Toolchain  --->
    Toolchain type (External toolchain)

And then enter appropriate location and prefix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
