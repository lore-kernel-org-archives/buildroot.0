From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:32:33 +0200
Subject: [Buildroot] [PATCH v7 06/31] package/kodi-jsonschemabuilder:
 new host package
In-Reply-To: <20170429083751.19625-7-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-7-bernd.kuhls@t-online.de>
Message-ID: <20170429113233.6d9f9e7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 10:37:26 +0200, Bernd Kuhls wrote:

>  create mode 120000 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
>  create mode 100644 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
>  rename package/{kodi/0002-texturepacker.patch => kodi-texturepacker/0001-texturepacker.patch} (100%)

This change was not related to this patch, it should have been in the
next patch, so I've dropped it from this commit.

> +KODI_JSONSCHEMABUILDER_LICENSE = GPLv2

We now use SPDX license codes, so I've changed this to GPL-2.0.

Applied with those issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
