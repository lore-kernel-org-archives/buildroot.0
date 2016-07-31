From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 20:28:51 +0200
Subject: [Buildroot] [PATCH] wavemon: depends on a toolchain with NPTL
In-Reply-To: <20160731125449.GA13036@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sun, 31 Jul 2016 14:54:50 +0200")
References: <20160731125449.GA13036@waldemar-brodkorb.de>
Message-ID: <87vazlr7a4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > The software uses pthread_mutexattr_setrobust which isn't
 > available in uClibc-ng Linuxthreads support.

 > Fixes:
 > http://autobuild.buildroot.net/results/d81b199c74cb4251f0b0eb975f66cb5016eb464c/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
