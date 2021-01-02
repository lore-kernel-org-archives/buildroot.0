From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 12:31:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/popperjs: new package
In-Reply-To: <20201208181638.28938-1-patrickdepinguin@gmail.com>
References: <20201208181638.28938-1-patrickdepinguin@gmail.com>
Message-ID: <20210102123140.5abde46f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Dec 2020 19:16:38 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Joeri Barbarien <joeri.barbarien@nokia.com>
> 
> Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/popperjs/Config.in     |  6 ++++++
>  package/popperjs/popperjs.hash |  3 +++
>  package/popperjs/popperjs.mk   | 19 +++++++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/popperjs/Config.in
>  create mode 100644 package/popperjs/popperjs.hash
>  create mode 100644 package/popperjs/popperjs.mk

Applied to master after changing the VERSION/SITE lines to:

+POPPERJS_VERSION = 1.16.0
+POPPERJS_SITE = $(call github,popperjs,popper-core,v$(POPPERJS_VERSION))

so that _VERSION doesn't contain the "v" prefix.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
