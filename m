From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 May 2014 23:20:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5base: stop qt stripping installed
	libraries
In-Reply-To: <1401348717-16224-1-git-send-email-will_wagner@carallon.com>
 (will wagner's message of "Thu, 29 May 2014 08:31:57 +0100")
References: <1401348717-16224-1-git-send-email-will_wagner@carallon.com>
Message-ID: <87r43c8epr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "will" == will wagner <will_wagner@carallon.com> writes:

 > From: Will Wagner <will_wagner@carallon.com>
 > By default the 'make install' step for qt5base will strip all the binaries
 > and libraries when they are installed to staging. This hinders debugging
 > as the libraries in staging dir have been stripped and is unnecessary
 > as buildroot will strip all files on the target

 > Signed-off-by: Will Wagner <will_wagner@carallon.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes v1 ->v2
 >   - fix spelling in commit log
 >   - add review by Yann

Committed, thanks.

-- 
Bye, Peter Korsgaard
