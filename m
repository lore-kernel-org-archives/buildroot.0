From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 18:19:20 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain-external: add Sourcery ARM
 2013.11, remove Sourcery ARM 2011.09
In-Reply-To: <1388143942-1187-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131229171920.GD3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-27 12:32 +0100, Thomas Petazzoni spake thusly:
> This commit adds the support for the recently release Sourcery ARM
> 2013.11 toolchain (gcc 4.8, gdb 7.6, glibc 2.18, gdb 7.6), and

As Baruch pointed out: duplicate 'gdb'.

> consequently removes the support for the Sourcery ARM 2011.09
> toolchain.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
