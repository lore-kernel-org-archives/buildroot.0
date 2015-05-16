From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 17:24:26 +0200
Subject: [Buildroot] [PATCH] libmatroska: add host-pkgconf dependency
In-Reply-To: <1431783410-1351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 May 2015 15:36:50 +0200")
References: <1431783410-1351-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k2w8a6l1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > libmatroska configure.ac uses PKG_CHECK_MODULES(), so this package
 > needs to depend on host-pkgconf.

 > Fixes:

 >   http://autobuild.buildroot.org/results/80a/80a9f0f5594ab833600ea8514dc184e50d2bf08c/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
