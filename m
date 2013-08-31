From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 13:50:01 +0200
Subject: [Buildroot] [PATCH 1/1] knock: new package
In-Reply-To: <1377899236-1659-1-git-send-email-rommel@layer-7.net>
References: <1377899236-1659-1-git-send-email-rommel@layer-7.net>
Message-ID: <20130831135001.3bf35efd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Rommel,

Thanks for your contribution! I won't repeat the comments made by
Thomas De Schampheleire since they are all obviously valid. Let me add
one other nitpick comment below.

On Fri, 30 Aug 2013 23:47:16 +0200, Michael Rommel wrote:

> +KNOCK_VERSION=7666f2e86e18d482eaad5fe1fea46d87d80b0555
> +KNOCK_SITE=https://github.com/jvinet/knock/tarball/master

There should be spaces around the equal sign, like you did in the lines
below.

> +KNOCK_LICENSE = GPLv2

Is it really GPLv2 or GPLv2+ ? Can you check the copyright headers in
the source files?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
