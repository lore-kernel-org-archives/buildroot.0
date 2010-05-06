From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 May 2010 10:14:37 +0200
Subject: [Buildroot] Graphing package dependencies
Message-ID: <20100506101437.5e35c795@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Following the question asked by Will yesterday, I just went ahead and
implement a small tool that generates a graph of dependencies for a
given package.

The result of this tool for the libgtk2 package can be seen at

  http://free-electrons.com/~thomas/libgtk2-package-dependencies.pdf

This is the kind of funny things we can do with a generic package
infrastructure :-)

The implementation of this tool is available in my graph-dependencies
branch at
http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=graph-dependencies.
There are three commits in this branch:

 * package: Add new <pkg>-show-depends to list dependencies

   http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=graph-dependencies&id=27ad37038055e5af12546a5941099264f37feecc

 * package: optimize the implementation of UPPERCASE

   http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=graph-dependencies&id=b6a46aaed9e497503b66789d1b212473d7c78b58

 * New graph-depends script

   http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=graph-dependencies&id=99c53bd52389c003707335d454d1bd1cace9ebfb

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
