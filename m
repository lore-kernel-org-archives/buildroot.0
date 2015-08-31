From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2015 22:19:29 +0200
Subject: [Buildroot] [PATCH 1/1] packages/lm-sensors: fix compilation
	with musl
In-Reply-To: <1441024748-11818-1-git-send-email-brendanheading@gmail.com>
 (Brendan Heading's message of "Mon, 31 Aug 2015 13:39:08 +0100")
References: <1441024748-11818-1-git-send-email-brendanheading@gmail.com>
Message-ID: <87h9nfrz1q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brendan" == Brendan Heading <brendanheading@gmail.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/f72/f72ae17cea910a1dbd3d5d4d09cfbc90d9ba8dc0/

 > Imports a patch from Alpine Linux to remove __GLIBC__ conditional
 > compilation. Retested with both musl, glibc and uclibc.

 > Patch accepted upstream.

 > Signed-off-by: Brendan Heading <brendanheading@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
