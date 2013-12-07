From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Dec 2013 11:00:20 +0100
Subject: [Buildroot] [PATCH] X.org: needs dynamic library support
In-Reply-To: <69e43f189c86e8be1570.1386365630@argentina> (Thomas De
 Schampheleire's message of "Fri, 06 Dec 2013 22:33:50 +0100")
References: <69e43f189c86e8be1570.1386365630@argentina>
Message-ID: <87txelasln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > xlib_libX11, one of the main libraries of X.org, uses dlfcn.h and dlopen.
 > To avoid having to add a dependency on !BR2_PREFER_STATIC_LIB on tons of
 > packages, we promote this dependency to X.org itself (similar to how thread
 > support is handled in X.org).

 > Fixes
 > http://autobuild.buildroot.net/results/a47/a47c5d96f880af04b85bb6773e87d04f9d7c2864/

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
