From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jun 2012 17:58:10 +0200
Subject: [Buildroot] Using Buildroot generated toolchain on different
 machine without Buildroot environment
In-Reply-To: <jsclju$7qc$1@dough.gmane.org>
References: <jscj4m$j2p$1@dough.gmane.org> <20120626171906.5ea51e6a@skate>
 <jsclju$7qc$1@dough.gmane.org>
Message-ID: <20120626175810.5725388e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 26 Jun 2012 15:48:14 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> Toolchains built with crosstool-ng can be moved anywhere, but all you
> end up with is the basic "libc" libraries.  You'll have to copy the
> libraries built by buildroot manually if you want to use them on the
> other hosts.

Correct, but many things besides the toolchain contain hardcoded paths:
the pkg-config binary, the external toolchain wrapper, the .la files,
etc. See the report I mentioned for details.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
