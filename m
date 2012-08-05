From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Aug 2012 22:18:32 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.16.0
In-Reply-To: <1344197156-20586-1-git-send-email-yann.morin.1998@free.fr>
References: <1344197156-20586-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120805221832.0d7d45ae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun,  5 Aug 2012 22:05:56 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/crosstool-ng/crosstool-ng.mk               |    2 +-
>  .../crosstool-ng.config-eglibc                     |   29 +++++++++------
>  .../crosstool-ng.config-glibc                      |   28 +++++++++------
>  .../crosstool-ng.config-uClibc                     |   39 +++++++++++---------
>  4 files changed, 58 insertions(+), 40 deletions(-)

Wouldn't it be possible to use mini-defconfigs instead of those
full .config?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
