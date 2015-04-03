From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Apr 2015 14:13:44 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/download: be more aggressive
 on missing hashes (branch yem/dl-hash-2)
In-Reply-To: <cover.1427840060.git.yann.morin.1998@free.fr>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
Message-ID: <20150403121344.GA4348@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-04-01 00:15 +0200, Yann E. MORIN spake thusly:
> This series makes hashes mandatory when a .hash file exists.

Please refrain from applying this series.

It does not play well with our autobuilders: we have a .hash file for
external toolchains: that works well for pre-built toolchains from the
well-known vendors, but that breaks for custom toolchains to be
downloaded, since there's no hash for those.

I'll see what I can come up with.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
