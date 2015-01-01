From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Jan 2015 17:52:15 +0100
Subject: [Buildroot] [PATCH v7 0/4] Improve silent builds
In-Reply-To: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150101165215.GD4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-12-30 14:58 +0100, Fabio Porcedda spake thusly:
> This patch set improves silent builds.

I've sent an updated, my simpler solution:
    http://patchwork.ozlabs.org/patch/424892/
    http://patchwork.ozlabs.org/patch/424893/

> After this patch set is accepted I will prepare a patch set to convert
> the other helpers (scp wget hg) to use the quiet flag instead of the
> environment variable.

Well, with this new solution, that will no longer be needed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
