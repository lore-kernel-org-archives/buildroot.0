From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:34:30 +0200
Subject: [Buildroot] [PATCH v3 1/3] atf: new package
In-Reply-To: <1433717727-30214-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1433717727-30214-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1433717727-30214-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20150611223430.47b7fb18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sebastien Bourdelin,

On Sun,  7 Jun 2015 18:55:25 -0400, Sebastien Bourdelin wrote:

> +ATF_VERSION = 0.21
> +ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
> +ATF_INSTALL_STAGING = YES
> +ATF_LICENSE = BSD-3c

The COPYING file actually has both BSD-2c and BSD-3c. Maybe specifying
only BSD-3c is OK since it's the same as BSD-2c + an additional
restriction. But I was just wondering what lead to mentioning only
BSD-3c.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
