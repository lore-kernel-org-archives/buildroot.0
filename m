From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:23:45 +0100
Subject: [Buildroot] [PATCH] package/weston: fix build on ancient
	Khronos headers
In-Reply-To: <1484480421-9402-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 15 Jan 2017 12:40:21 +0100")
References: <1484480421-9402-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k29vdwha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Backport two patches from upstream, to build against ancient headers
 > and when EGL is not available.

 > Fixes:
 >     http://autobuild.buildroot.net/results/2de/2dea0a1b82c535fded6fd67a69496d70e6bcca56
 >     http://autobuild.buildroot.org/results/112/1125199749455e349d8eb87ca86c778763aae489

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
