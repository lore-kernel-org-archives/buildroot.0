From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 13:43:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with RELRO
In-Reply-To: <20191031102306.15433-1-fontaine.fabrice@gmail.com>
References: <20191031102306.15433-1-fontaine.fabrice@gmail.com>
Message-ID: <20191031134302.685d1858@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

As usual, thanks for working on build issues.

On Thu, 31 Oct 2019 11:23:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch b/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch
> new file mode 100644
> index 0000000000..831e4816e1
> --- /dev/null
> +++ b/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch
> @@ -0,0 +1,35 @@
> +From e2dfb2ece19748ba99ec8199fc902c0c9daff325 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 30 Oct 2019 18:55:48 +0100
> +Subject: [PATCH] CMakeLists.txt: Add USE_PRECOMPILED_HEADER option
> +
> +Add USE_PRECOMPILED_HEADER to allow the user to disable precompiled
> +header feature. Thanks to this, domoticz will be able to be built with
> +RELRO on buildroot

What is the relationship between using precompiled headers and relro
build problems ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
