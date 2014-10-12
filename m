From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 16:28:24 +0200
Subject: [Buildroot] [PATCH] qlibc : new package
In-Reply-To: <1413119531-20050-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 12 Oct 2014 15:12:11 +0200")
References: <1413119531-20050-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877g05xszb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Sagaert Johan <sagaert.johan@skynet.be>
 > [Thomas:
 >  - add dependency on threads, wchar and dynamic librayr
 >  - add dependency on libiconv when locale support is not enabled
 >  - replace patch hacking includedir by a patch that lets the Makefile
 >    obey to $(DESTDIR)
 >  - remove optional OpenSSL and MySQL support which simply cannot work
 >    due to the usage of AC_CHECK_FILE() in configure.ac, this required
 >    an additional patch to fix the bogus AC_ARG_WITH() calls.
 >  - move from 'Miscellaneous' to 'Libraries' -> 'Other'.
 >  - fixup the licensing information.]

 > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
