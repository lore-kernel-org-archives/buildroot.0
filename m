From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:07:30 +0200
Subject: [Buildroot] [PATCH 1/1] mtd: Allow holes in volume ID table
In-Reply-To: <1532089807-97597-1-git-send-email-david.owens@rockwellcollins.com>
 (David Owens's message of "Fri, 20 Jul 2018 07:30:07 -0500")
References: <1532089807-97597-1-git-send-email-david.owens@rockwellcollins.com>
Message-ID: <87wosgkx19.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Owens <david.owens@rockwellcollins.com> writes:

 > A regression in the mtd package prevents non-consecutive ubi volume IDs
 > from working properly.  This change reverts the commit [0].  The issue
 > was originally described on the mtd mailing list:

 > http://lists.infradead.org/pipermail/linux-mtd/2018-June/081562.html

 > [0] http://git.infradead.org/mtd-utils.git/commitdiff/dede98ffb706676309488d7cc660f569548d5930

 > Signed-off-by: David Owens <david.owens@rockwellcollins.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
