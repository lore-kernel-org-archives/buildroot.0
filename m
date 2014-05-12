From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 May 2014 22:17:59 +0200
Subject: [Buildroot] [PATCH] libmbus: fix upstream location
In-Reply-To: <1399925448-11644-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 12 May 2014 22:10:48 +0200")
References: <1399925448-11644-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ha4u7nuw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The libmbus tarball is no longer available at
 > http://www.freescada.com/public-dist. Apparently, the new upstream is
 > at http://www.rscada.se/libmbus/ and tarballs are at
 > http://www.rscada.se/public-dist/. Without this patch, the current
 > download of libmbus-0.8.0.tar.gz downloads an HTML document with an
 > error, which cannot be extracted, obviously.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
