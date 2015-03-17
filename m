From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 10:15:43 +0100
Subject: [Buildroot] [PATCH 0/3] support/download: be more aggressive on
 missing hashes (branch yem/dl-hash)
In-Reply-To: <cover.1426545571.git.yann.morin.1998@free.fr>
References: <cover.1426545571.git.yann.morin.1998@free.fr>
Message-ID: <20150317091543.GA4729@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-03-16 23:41 +0100, Yann E. MORIN spake thusly:
> This series makes hashes mandatory when a .hash file exists.

Forget this series: it is broken for git downloads, and potentially for
all non-tarball downloads as well...

Sorry...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
