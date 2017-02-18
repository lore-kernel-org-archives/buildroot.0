From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 15:47:36 +0100
Subject: [Buildroot] [PATCHv2 3/3] gstreamer1: drop unused configure
	time unaligned access handling logic
In-Reply-To: <20170218131805.20242-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 18 Feb 2017 14:18:05 +0100")
References: <20170218131805.20242-1-peter@korsgaard.com>
 <20170218131805.20242-3-peter@korsgaard.com>
Message-ID: <87shnbsghj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > gstreamer has moved to build time unaligned access support detection using
 > ifdefs in gstconfig.h since 1.9.2:

 > commit 6ef601367e0f5adb7a8b02cec94dec04fccf701a
 > Author: Nirbheek Chauhan <nirbheek@centricular.com>
 > Date:   Tue Jun 21 18:59:49 2016 +0530

 >     gstconfig.h: Detect unaligned access support at compile-time

 >     This makes gstconfig.h completely arch-independent. Should cover all
 >     compilers that gstreamer is known to build on, and all architectures
 >     that I could find information on. People are encouraged to file bugs if
 >     their platform/arch is missing.

 > So ac_cv_unaligned_access is no longer used and our logic can be removed.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
