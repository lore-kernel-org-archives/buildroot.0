From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jun 2012 09:12:19 +0200
Subject: [Buildroot] [PATCH] php: force cross-compilation
In-Reply-To: <87y5ndbxgl.fsf@macbook.be.48ers.dk>
References: <1340317344-22807-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87y5ndbxgl.fsf@macbook.be.48ers.dk>
Message-ID: <20120625091219.539a3740@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 23 Jun 2012 22:11:06 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Thanks, committed. It would be good to add cache support to
> ac_cv_prog_cc_cross, so we could just pass ac_cv_prog_cc_cross=yes in
> PHP_CONF_ENV, but ok.

Well, since we can't easily change the configure.in file and regenerate
the configure script (due to the very old version of autoconf that PHP
developers use), I'm not sure it's really worth the effort. But on the
other hand, it's true that it would potentially make it possible to have
the patch upstream.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
