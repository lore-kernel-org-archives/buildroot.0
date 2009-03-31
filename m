From: Jeff Steele <jsteele@coloradocollege.edu>
Date: Mon, 30 Mar 2009 19:57:32 -0600
Subject: [Buildroot] make rebuilds cross tools every time ?
Message-ID: <1238464652.5157.44.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm brand new to buildroot, and so far I'm very pleased with it.  One
problem I've been having is that it seems to rebuild uClibc and the
cross compiler/toolchain *every time* I type "make".

For example, tar-1.18 failed to compile, so I edited tar.mk to bump the
version up to 1.20.  Then I did:

# rm -rf tar-1.18
# make

Before I find out if the new version of tar compiles (it does, BTW...),
I have to wait for the whole toolchain to be rebuilt.

Am I doing something wrong ?  Shouldn't the toolchain be independent of
target apps ?


THx


BTW, I'm using buildroot-2009.02, building for armeb, host is x86.
