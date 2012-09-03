From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Sep 2012 09:14:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-09-02
In-Reply-To: <504457E8.3010301@relinux.de>
References: <20120903063225.52446428001@lolut.humanoidz.org>
 <504457E8.3010301@relinux.de>
Message-ID: <20120903091457.3bd8061e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 03 Sep 2012 09:10:32 +0200,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> are these randomly selected?
> 
> This one was already there yesterday.

The toolchain configuration is randomly chosen from a list of
pre-defined toolchain configurations.

The packages configuration is randomly chosen (using 'make
randpackageconfig').

So it is very possible to have the same build failure two days in a
row, or even multiple times during a single day.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
