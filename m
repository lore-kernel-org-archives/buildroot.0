From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 22:07:59 +0100
Subject: [Buildroot] [PATCH] python-pycrypto: ignore LICENSE.orig for
 the moment
In-Reply-To: <1387731898-14058-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1387731898-14058-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131222210759.GI27858@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-22 18:04 +0100, Thomas Petazzoni spake thusly:
> LICENSE.orig gets removed from the source tree by the apply-patches.sh
> script. Until this is fixed in apply-patches.sh, remove LICENSE.orig
> from <pkg>_LICENSE_FILES to fix the autobuilder issues.

Can't we have a post-extract hook that renames that file, so we can add
it to the legal-info?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
