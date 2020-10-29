From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 16:04:54 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/opencv3: fix build with atomic
In-Reply-To: <20201017134623.3457333-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Oct 2020 15:46:23 +0200")
References: <20201017134623.3457333-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9etgjjd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Restore the atomic workaround that was wrongly removed when bumping to
 > version 3.4.9 in commit f6fb2cae0691d25b034b12a16261ee26096db7d1 as it
 > seems that opencv3 still needs help to detect atomic library

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9162b29725f8d9b891eb74fcb8078f211140a841

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Restore workaround instead of setting -DHAVE_CXX_ATOMICS_WITHOUT_LIB

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
