From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 14 Dec 2010 21:14:08 +0100
Subject: [Buildroot] [PATCH 09/13] binutils: make it a proper package
In-Reply-To: <1292353569-30172-10-git-send-email-gustavo@zacarias.com.ar>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
	<1292353569-30172-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201012142114.08660.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 14 December 2010 20:06:05 Gustavo Zacarias wrote:
> * Convert binutils to a proper autotargets package
> * Add version 2.21
> * Drop version 2.17

I won't speak for Peter, but I'd suggest at least two patches:
- one to convert
- one to add/drop

This will make it easier to review, because: TL-DR. :-p

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
