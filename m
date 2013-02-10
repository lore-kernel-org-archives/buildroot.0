From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Feb 2013 21:50:20 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as soure of
	kernel code
In-Reply-To: <1360310725-6463-2-git-send-email-rafal.fabich@gmail.com>
References: <1360310725-6463-1-git-send-email-rafal.fabich@gmail.com>
 <1360310725-6463-2-git-send-email-rafal.fabich@gmail.com>
Message-ID: <201302102150.20584.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rafal, All,

On Friday 08 February 2013 Rafal Fabich wrote:
> In 'menuconfig' user can choose the local directory as a source of Linux
> kernel code.
> Useful during kernel drivers or modules development.

Why not using the _OVERRIDE_SRCDIR mechanism:
    $ export LINUX_OVERRIDE_SRCDIR=/path/to/your/kernel/tree

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
