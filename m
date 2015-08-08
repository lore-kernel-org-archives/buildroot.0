From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 12:39:56 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/qt5quickcontrols: fix
 licensing information
In-Reply-To: <1438984606-27797-1-git-send-email-yann.morin.1998@free.fr>
References: <1438984606-27797-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150808123956.6b912425@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  7 Aug 2015 23:56:46 +0200, Yann E. MORIN wrote:

>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5QUICKCONTROLS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> -QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
> +QT5QUICKCONTROLS_LICENSE = LGPLv3, GPLv2, GFDL

It is actually GFDLv1.3

I've fixed this and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
