From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Aug 2012 22:15:22 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.16.0
In-Reply-To: <1344197156-20586-1-git-send-email-yann.morin.1998@free.fr>
References: <1344197156-20586-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <201208052215.23035.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 05 August 2012 22:05:56 Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/crosstool-ng/crosstool-ng.mk               |    2 +-
>  .../crosstool-ng.config-eglibc                     |   29 +++++++++------
>  .../crosstool-ng.config-glibc                      |   28 +++++++++------
>  .../crosstool-ng.config-uClibc                     |   39 +++++++++++---------
>  4 files changed, 58 insertions(+), 40 deletions(-)

That one comes a bit after -rc1, because the crosstool-NG release was a bit
late (4 days late). Nonetheless, it is not really late when compared to
the submissions for previous releases (2012.05: the 8th, 2012.02: the 9th).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
