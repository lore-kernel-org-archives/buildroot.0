From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 00:22:20 +0200
Subject: [Buildroot] [PATCH 1/2] audacious: new package
In-Reply-To: <1466590084-21798-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466590084-21798-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160702002220.483d6c32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 07:08:03 -0300, Gustavo Zacarias wrote:

> +AUDACIOUS_VERSION = 3.7.2
> +AUDACIOUS_SITE = http://distfiles.audacious-media-player.org
> +AUDACIOUS_SOURCE = audacious-$(AUDACIOUS_VERSION)-gtk3.tar.bz2
> +AUDACIOUS_DEPENDENCIES = dbus libglib2 libgtk3 host-pkgconf
> +AUDACIOUS_INSTALL_STAGING = YES
> +AUDACIOUS_LICENSE = BSD-2c

True, but the license file also says there is an exception for the
icons (Public Domain) and for libguess, under BSD-3c. This should be
noted here.

(I would have fixed this myself, but the licensing issue is more
serious for the plugins package, to which I'll reply separately).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
