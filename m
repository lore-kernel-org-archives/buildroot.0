From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jun 2012 08:45:48 +0200
Subject: [Buildroot] Various problem using buildroot-2012.05
In-Reply-To: <1339990515.26331.YahooMailClassic@web161404.mail.bf1.yahoo.com>
References: <1339990515.26331.YahooMailClassic@web161404.mail.bf1.yahoo.com>
Message-ID: <20120618084548.76c4bed8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 17 Jun 2012 20:35:15 -0700 (PDT),
Ming-Ching Tiew <mctiew@yahoo.com> a ?crit :

> I encountered various problems using buildroot-2012.05, all to do
> with using buildroot as a chroot build environment.

Why would you do this?

Buildroot is here to cross-compile your libraries and applications, it
really doesn't make much sense to use it to generate a chrooted
environment in which you compile your applications. At least, that's
not how Buildroot developers/users typically use Buildroot, so it's an
area (using a native compiler on the target, with development files)
that doesn't receive a lot of attention, hence the problems you are
facing.

To the community: there seem to be an increasing number of people who
misunderstand how to use Buildroot properly. Should we simply get rid
of the "toolchain on target" option? Should we write a FAQ question
about this? Generally speaking, I don't think Buildroot is the good
tool to build a full-featured system that includes a compiler and all
related development tools to build stuff on the target. What do others
think about this?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
