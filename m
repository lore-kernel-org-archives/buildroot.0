From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Aug 2019 16:33:39 +0200
Subject: [Buildroot] [PATCH 1/4] host-go-glide: new package
In-Reply-To: <1538143163-20596-2-git-send-email-fabiorush@gmail.com>
References: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
 <1538143163-20596-2-git-send-email-fabiorush@gmail.com>
Message-ID: <20190803143218.GA23791@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

Sorry for the long delay before replying to your patch...

On 2018-09-28 10:59 -0300, Fabio Urquiza spake thusly:
> From: Fabio Urquiza <flus@dmz.org.br>
> A package management for Golang.

We've discussed this patch during the developpers meeting today, and
we've decided to not apply this patch, because go-glide is now
deprecated, and replaced by "go modules", as discussed in that thread
from last April:

    http://lists.busybox.net/pipermail/buildroot/2019-April/247191.html

And since the two go-based packages in your series (btcd and neutrino)
already appear to support go modules, we don't see the point in having
go-glide.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
