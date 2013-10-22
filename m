From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 16:25:35 +0200
Subject: [Buildroot] [PATCH] tslib: needs dynamic library for dlopen
In-Reply-To: <a0f5079cb28446c5d278.1382078683@argentina> (Thomas De
 Schampheleire's message of "Fri, 18 Oct 2013 08:44:43 +0200")
References: <a0f5079cb28446c5d278.1382078683@argentina>
Message-ID: <87vc0pbcww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/1242cbea015e5a24a6621d1bd5569d2a1a819bb4/

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 > v2: - propagate dependency to selectors of tslib (ThomasP)
 >     - shared library -> dynamic library (shame on me)

Committed, thanks.

-- 
Bye, Peter Korsgaard
