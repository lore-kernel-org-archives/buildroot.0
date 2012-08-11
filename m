From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 20:21:14 +0200
Subject: [Buildroot] Open question: remove "toolchain on target" option
Message-ID: <20120811202114.3a95d4ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Today, I'd like to open the debate of the "toolchain on target"
configuration option. This option normally allows to install
binutils/gcc, and together with "install development files on target",
should allow to have a complete development environment on the target.

However, I see a number of problems with this:

 (1) A large number of first time users try to use this, and fall into
     problems, because this feature is mostly unmaintained. This gives
     a poor image of Buildroot's quality.

 (2) A large number of first time users try to use this, because they
     misunderstand what Buildroot is (a cross-compilation environment)
     and they try to use it for something that nobody amongst the core
     Buildroot developers is doing, and therefore is poorly supported.

 (3) None of the core Buildroot developers seem to care about this,
     no-one is apparently using/fixing this mechanism.

So, rather than having a bad and dysfunctional mechanism to have a
toolchain on the target, I would suggest that we simply get rid of it.
Of course, I am not going to take the decision alone, Peter will have
to do it, but I wanted to start the discussion around this topic and
gather opinions from people in the community.

Thoughts?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
