From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:31:09 +0200
Subject: [Buildroot] [PATCH] package/luaossl: new package
In-Reply-To: <20170529143205.29529-1-m.niestroj@grinn-global.com>
References: <20170529143205.29529-1-m.niestroj@grinn-global.com>
Message-ID: <20170531213109.6f30f5c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 16:32:05 +0200, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/Config.in            |  1 +
>  package/luaossl/Config.in    | 18 ++++++++++++++++++
>  package/luaossl/luaossl.hash |  2 ++
>  package/luaossl/luaossl.mk   | 14 ++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 package/luaossl/Config.in
>  create mode 100644 package/luaossl/luaossl.hash
>  create mode 100644 package/luaossl/luaossl.mk

You forgot to add yourself in the DEVELOPERS file for this package, so
I've done so, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
