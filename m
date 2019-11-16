From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Nov 2019 10:42:20 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/ltp-testsuite: proper fix
 for missing __kernel_fsid_t
In-Reply-To: <20191116003638.7666-1-petr.vorel@gmail.com>
References: <20191116003638.7666-1-petr.vorel@gmail.com>
Message-ID: <20191116094220.GC32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-11-16 01:36 +0100, Petr Vorel spake thusly:
> Backported 4 fixes from upstream (2 of them require calling autoreconf).
> 
> Fixes: http://autobuild.buildroot.net/results/7a29e3b767e3d23dd64c130daa735ca6c062baf8
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[--SNIP--]
> regression found and sent upstream [1], see notes there.
> I'd prefer merging this after it's merged upstream.
[--SNIP--]
> [1] https://patchwork.ozlabs.org/patch/1195915/

I've added this URL to the description of patch 7, and applied to
master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
