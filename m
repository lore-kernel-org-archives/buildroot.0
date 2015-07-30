From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 22:57:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: fix build issues
 under musl
In-Reply-To: <1438271680-3692-1-git-send-email-brendanheading@gmail.com>
References: <1438271680-3692-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150730225755.0c14d597@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Thu, 30 Jul 2015 16:54:40 +0100, Brendan Heading wrote:

> ++AX_GCC_FUNC_ATTRIBUTE(always_inline)
> ++
> ++if test "x$ax_cv_have_func_attribute_always_inline" = xyes; then
> ++    AC_DEFINE([HAVE_ALWAYS_INLINE], [1], [Enable always_inline support])
> ++fi
> ++

This should no longer be part of the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
