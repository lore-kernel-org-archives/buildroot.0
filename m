From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Jun 2015 20:03:38 +0200
Subject: [Buildroot] [PATCH 0/11 v2] pkg-kernel-module: new infra to
 ease building kernel modules (branch yem/kernel-modules)
In-Reply-To: <cover.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <20150611180338.GA3689@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

On 2015-06-10 21:22 +0200, Yann E. MORIN spake thusly:
> This series introduces a new infrastructure to help writing packages
> that build kernel modules.

I'll mark this series as "Changes Requested" in patchwork, because I took
Jeremy's comment into account, and because I was able to improve it yet a
bit more and convert one more kernel-module-providing package (namely,
nvidia-driver; who would have thought it would be possible? ;-) ).

So, I'll respin later, but I'm still interested in reviews on this
iteration.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
