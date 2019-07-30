From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 23:36:09 +0200
Subject: [Buildroot] [PATCH] pandaboard_defconfig: bump linux to 4.19.62
 to fix build with gcc 8
In-Reply-To: <20190730123315.24775-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 30 Jul 2019 14:33:15 +0200")
References: <20190730123315.24775-1-peter@korsgaard.com>
Message-ID: <87y30f433q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The recent change to default to gcc 8 for the internal toolchain broke this
 > defconfig.  Fix it by bumping to the latest 4.19 kernel.

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/259853955

 > The kernel now uses ttySx for the omap serial ports, so adjust the getty
 > port to match.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
