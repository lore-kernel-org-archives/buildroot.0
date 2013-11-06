From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 23:27:58 +0100
Subject: [Buildroot] [PATCH 5/5] Makefile: fix out-of-tree builds with
	multiple targets with 'all'
In-Reply-To: <155f4535a09b1cdce293c75108211da899c3a0a8.1383693880.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 6 Nov 2013 00:28:20 +0100")
References: <cover.1383693880.git.yann.morin.1998@free.fr>
 <155f4535a09b1cdce293c75108211da899c3a0a8.1383693880.git.yann.morin.1998@free.fr>
Message-ID: <87ob5xjhch.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > For out-of-tree builds, this use-case fails to build:
 >     $ make clean all

 > This is because 'all' is filtered-out in the Makefile wrapper, since
 > the wrapper itself has a 'all' target.

 > The 'all' target is just the usual naming for the default target in a
 > Makefile. In fact, the first target is the default one, so we can name
 > it whatever we want.

 > Rename the Makefile wrapper 'all' target to avoid name-clashing.

 > Fixes #6644.

 > Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Tested-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
