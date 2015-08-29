From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:34:34 +0200
Subject: [Buildroot] [PATCH/next 03/10] package/libsilk: new package
In-Reply-To: <1439317015-8031-4-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
 <1439317015-8031-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829103434.6d2a483d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 11 Aug 2015 20:16:48 +0200, Bernd Kuhls wrote:
> sq silk

This commit log is not very useful :)

> +LIBSILK_VERSION = 4268a02240c35c6055b0f237c46b09b2dcf79e45
> +# we use the FreeSwitch fork because it contains pkgconf support
> +LIBSILK_SITE = https://freeswitch.org/stash/scm/sd/libsilk.git
> +LIBSILK_SITE_METHOD = git
> +LIBSILK_LICENSE = Skype

The license is BSD-3c, not some special Skype license. Skype is the
name of the copyright owner.

Committed to next with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
