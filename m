From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Sep 2010 14:54:14 +0200
Subject: [Buildroot] [PATCH 1/3] package: drop special case for
 target-install with BR2_ENABLE_DEBUG
In-Reply-To: <1284812207-31798-2-git-send-email-llandwerlin@gmail.com>
References: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
	<1284812207-31798-2-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100918145414.197a874c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Sep 2010 14:16:45 +0200
llandwerlin at gmail.com wrote:

> install-exec isn't used anymore

This is going to conflict with another patch I'm doing, which removes
the use of install-strip when BR2_ENABLE_DEBUG is set.

I'll try to merge them.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
