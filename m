From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 May 2014 23:44:22 +0200
Subject: [Buildroot] [PATCH] clapack: disable on blackfin
In-Reply-To: <1399972300-1485-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Tue, 13 May 2014 11:11:40 +0200")
References: <1399972300-1485-1-git-send-email-s.martin49@gmail.com>
Message-ID: <877g5puzex.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > The "_" symbol prefix added by the blackfin toolchain causes "undefined
 > symbol" build failures when the compiler is trying to link a binary
 > with libblas and/or liblapack.

 > This patch also disables clapack reverse dependencies: armadillo.

 > Fixes:
 >   http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
