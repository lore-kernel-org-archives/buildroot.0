From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Nov 2012 22:31:30 +0100
Subject: [Buildroot] [PATCH] List all the available hook points
In-Reply-To: <1353273224-14685-1-git-send-email-zinosat@tiscali.it>
References: <1353273224-14685-1-git-send-email-zinosat@tiscali.it>
Message-ID: <201211182231.31326.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Davide, Samuel, All,

On Sunday 18 November 2012 Davide Viti wrote:
> The list was obtained with the following command:
>   grep "_HOOKS[ ]\+?=" package/pkg-generic.mk

This patch is the patch in bug #5726:
    https://bugs.busybox.net/show_bug.cgi?id=5726

Samuel, this is a documentation fix for the manual: I think it should
be applied for 2012.11.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(Note: Samuel: this is your first act as doc maintainer! ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
