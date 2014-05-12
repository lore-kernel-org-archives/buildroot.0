From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 May 2014 00:18:59 +0200
Subject: [Buildroot] [PATCH] cppcms: needs NPTL support
In-Reply-To: <1399932559-12200-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 13 May 2014 00:09:19 +0200")
References: <1399932559-12200-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874n0uwsh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > cppcms uses some thread functions that are not available in certain
 > uClibc thread implementations. Even though a bit more restrictive than
 > necessary, adding a NPTL dependency is the easiest solution, and is
 > quite logical for a relatively large and complex package such as
 > cppcms.

 > Fixes:

 >   http://autobuild.buildroot.net/results/a26/a26574419aacbea4140dfca1d503bcab599edd71/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
