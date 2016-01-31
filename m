From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:08:41 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/sconeserver: bump version to
 fix musl build
In-Reply-To: <1454270691-21900-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454270691-21900-1-git-send-email-bernd.kuhls@t-online.de>
 <1454270691-21900-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131230841.4d4da767@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 21:04:51 +0100, Bernd Kuhls wrote:

> -# Release 0.6.0 doesn't build cleanly, so use a recent
> -# Git commit.
> -SCONESERVER_VERSION = 3b886c3dda6eda39bcb27472d29ed7fd3185ba1d
> +SCONESERVER_VERSION = c4b8e14f6e9e06cbff5b4195f69d6fce9391a1cd
>  SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
>  SCONESERVER_LICENSE = GPLv2+
>  SCONESERVER_LICENSE_FILES = COPYING
> -# For 0001-fix-ssl-libs-ordering.patch and configure isn't up to date
> +# upstream tarball does not contain a configure script

This comment is a bit wrong/misleading, because there is no such thing
as an upstream tarball, as we're fetching from Git.

I've fixed that and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
