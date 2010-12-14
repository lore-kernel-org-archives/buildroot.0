From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 14 Dec 2010 20:54:04 +0100
Subject: [Buildroot] [PATCH 05/13] package infra: fix versioned patches
	for host packages
In-Reply-To: <1292353569-30172-6-git-send-email-gustavo@zacarias.com.ar>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
	<1292353569-30172-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201012142054.04574.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On Tuesday 14 December 2010 20:06:01 Gustavo Zacarias wrote:
> Without this patch we'd need separate versioned patch directories for
> target and host packages, thus having unwanted duplication.

Maybe this should come first, before the gmp/mpfr/mpc patches?

I believe it is not related to making toolchain components proper packages.
I mean, it can be seen as a bug in the existing infra, so has to come before
the actual changes that do need it, or uncovered the issue, no?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
