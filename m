From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 22:30:50 +0100
Subject: [Buildroot] [PATCH 00/13] Documentation updates and improvements
In-Reply-To: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 23 Feb 2014 16:04:26 +0100")
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9dho6t1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Here is a set of documentation updates and improvements, about
 > toolchains, package infrastructures, dependency and build-time
 > graphing, and also finally a documentation about
 > <pkg>_OVERRIDE_SRCDIR.

 > Thomas

 > Thomas Petazzoni (13):
 >   docs/manual: toolchain packages no longer use custom makefiles
 >   docs/manual: rephrase part about rebuilding packages
 >   docs/manual: rephrase and expand part on when a full rebuild is
 >     necessary
 >   docs/manual: reference Python and Lua infras from the list of package
 >     infrastructures
 >   docs/manual: add section about dependency graphs
 >   docs/manual: add section about build time graphing
 >   docs/manual: update informations about C library in internal backend
 >   docs/manual: update external toolchain examples
 >   docs/manual: mention that custom toolchains is also useful for BR
 >     toolchains
 >   docs/manual: rephrase paragraph about unsupported external toolchains
 >   docs/manual: refresh informations about *-menuconfig targets
 >   docs/manual: document the usage of <pkg>_OVERRIDE_SRCDIR
 >   docs/manual: mention the per-package graph-depends target

Committed series with the minor changes suggested by Yann, thanks.

-- 
Bye, Peter Korsgaard
