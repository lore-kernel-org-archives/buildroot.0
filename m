From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 28 Sep 2010 18:25:23 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain: add new toolchain backend:
	crosstool-NG
In-Reply-To: <1284926049-9882-3-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1284926049-9882-3-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <201009281825.23741.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sunday 19 September 2010 21:54:09 Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
> ---
>  Makefile                                           |    4 +-
>  package/Makefile.in                                |    2 +
>  toolchain/Config.in                                |    9 +
>  ...chain-external.mk => toolchain-crosstool-ng.mk} |    4 +-
>  toolchain/toolchain-crosstool-ng/Config.in         |   60 +++
>  .../toolchain-crosstool-ng/crosstool-ng.config     |  360 +++++++++++++++
>  toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |  275 +++++++++++
>  .../uClibc.config}                                 |  126 +++---
>  8 files changed, 773 insertions(+), 67 deletions(-)

Ping? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
