From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 21:51:17 +0100
Subject: [Buildroot] [PATCH 0/4] Fix locale generation with uClibc,
	and related improvements
In-Reply-To: <1415917046-14446-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 13 Nov 2014 23:17:22 +0100")
References: <1415917046-14446-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874mtsp9a2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This set of patches fix the locale generation with uClibc: without those fixes, the value in the BR2_GENERATE_LOCALE option is ignored due to a regression introduced by a rework of the main Makefile.

 > The most important patch is PATCH 2, which does the actual fix. PATCH
 > 1 is a preparatory cleanup. PATCH 3 and 4 are additional minor
 > improvements to the BR2_GENERATE_LOCALE option logic.

 > I think this should be considered material for 2014.11.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
