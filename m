From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 12:02:11 +0200
Subject: [Buildroot] [PATCH] libebml: properly support static only builds
In-Reply-To: <1408094588-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 15 Aug 2014 11:23:08 +0200")
References: <1408094588-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877g2a2hr0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adjusts the libebml package to not build a shared library
 > when BR2_PREFER_STATIC_LIB=y.

 > Fixes:

 >   http://autobuild.buildroot.org/results/262/26279f72b6c5708f363b3cce2102afa0eccc3a72/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
