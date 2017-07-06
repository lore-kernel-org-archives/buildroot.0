From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 20:25:26 +0200
Subject: [Buildroot] [PATCH] libtomcrypt: bump to version 1.18.0-rc1
In-Reply-To: <20170706175456.11742-1-francois.perrad@gadz.org>
References: <20170706175456.11742-1-francois.perrad@gadz.org>
Message-ID: <20170706202526.365ec65c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 19:54:56 +0200, Francois Perrad wrote:

> -LIBTOMCRYPT_VERSION = 1.17
> -LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/$(LIBTOMCRYPT_VERSION)
> -LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.bz2
> +LIBTOMCRYPT_VERSION = 1.18.0-rc1

Why would we upgrade to a release candidate version?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
