From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 21:14:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/transmission: Fix
 compilation when using system libminiupnpc with libutp disabled
In-Reply-To: <1470332691-32417-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470332691-32417-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160805211454.6e164409@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


> +If transmission uses its own copy of libminiupnpc in third-party/ then
> +the configure script adds that path to CFLAGS:
> +https://trac.transmissionbt.com/browser/trunk/configure.ac#L455
> +
> +This patch is also added if transmission uses its own copy of libutp:

patch -> path

Applied with this typo fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
