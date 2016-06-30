From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:44:19 +0200
Subject: [Buildroot] [PATCH v1] package/grantlee: upgrade to 5.1.0,
 remove obsolote Qt4 build option
In-Reply-To: <1467203620-11767-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1467203620-11767-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20160701004419.3939f072@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In the title: obsolote -> obsolete

On Wed, 29 Jun 2016 14:33:40 +0200, Zoltan Gyarmati wrote:

> -ifeq ($(BR2_PACKAGE_QT),y)
> -GRANTLEE_DEPENDENCIES = qt
> -else ifeq ($(BR2_PACKAGE_QT5),y)
>  GRANTLEE_DEPENDENCIES += qt5base qt5script

I've changed this from += to =.

And then applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
