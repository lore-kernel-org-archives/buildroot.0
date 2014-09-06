From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 22:14:31 +0200
Subject: [Buildroot] [PATCH] libiscsi: bump version to 1.12.0
In-Reply-To: <1410012040-16794-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Sep 2014 16:00:40 +0200")
References: <1410012040-16794-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877g1go6ag.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit bumps libiscsi to version 1.12.0, which requires a few
 > changes:

 >  - A number of patches to get libiscsi to build properly.
 >  - The removal of the popt dependency, which is no longer needed.
 >  - The removal of unnecessary spaces for alignment of variable
 >    definitions in libiscsi.mk.

Committed, thanks. Don't forget to send the patches upstream.

-- 
Bye, Peter Korsgaard
