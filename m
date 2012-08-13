From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 02:00:24 +0200
Subject: [Buildroot] [PATCH 01/36] system/init: add option for no init
	system
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <201208130200.24426.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Sorry, I forgot an intro mail... Here it is:

This series is an attempt to add QEMU as a package.

It first tries to fix a few short-comings I encounterd:
  patches 1 & 2

It then adds a few new packages that are dependencies of QEMU, some optional:
  patches 3 to 10

Then it adds QEMU as a new package, with everything disabled:
  patch 11

Then it adds a few config options to QEMU, to enable/disable some features:
  patches 12 to 34

And finally it moves QEMU options to a sub-menu:
  patch 35

A last patch, which I'd like feedback on, enables building static QEMU
executables:
  patch 36

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
