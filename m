From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:09:10 +0200
Subject: [Buildroot] [PATCH] package/terminology: new package
In-Reply-To: <1468787781-5576-1-git-send-email-romain.naour@gmail.com>
References: <1468787781-5576-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160724150910.0c2cb5a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 22:36:21 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/Config.in                    |  1 +
>  package/terminology/Config.in        |  9 +++++++++
>  package/terminology/terminology.hash |  2 ++
>  package/terminology/terminology.mk   | 17 +++++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/terminology/Config.in
>  create mode 100644 package/terminology/terminology.hash
>  create mode 100644 package/terminology/terminology.mk

Applied with the following changes:

    [Thomas:
     - rewrap Config.in help text
     - fix license, it's BSD-2c, not just "BSD"
     - add dependency on host-pkgconf]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
