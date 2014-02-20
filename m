From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Feb 2014 19:15:11 +0100
Subject: [Buildroot] [PATCH] libsepol: fix static-only library build
In-Reply-To: <1392903170-8912-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 20 Feb 2014 14:32:50 +0100")
References: <1392903170-8912-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bny1y7kg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Add a patch that improves the libsepol build system to support
 > static-only library build.

 > Fixes:

 >   http://autobuild.buildroot.org/results/30c/30cb919d2bbf51bfdf0a83c618124d927d046a61/build-end.log

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
