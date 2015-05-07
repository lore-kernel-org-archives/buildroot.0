From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2015 22:36:43 +0200
Subject: [Buildroot] [PATCH] Backport valgrind patch to fix build on 4.0
	host kernels
In-Reply-To: <1430933218-10933-1-git-send-email-christian@gridshowsystems.com>
 (Christian Artin's message of "Wed, 6 May 2015 13:26:58 -0400")
References: <1430933218-10933-1-git-send-email-christian@gridshowsystems.com>
Message-ID: <871tism8f8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Artin <christian@gridshowsystems.com> writes:

 > Valgrind fails to build when the host kernel is >=4.0. This patch
 > backports the commit from upstream that fixes the kernel version
 > verification. This verification is pointless for buildroot anyway, but
 > it fixes the building process.

 > Signed-off-by: Christian Artin <christian@gridshowsystems.com>

Thanks, committed with a few minor fixes:

- We already have a 0001-.. patch for valgrind, so renamed to 0002-Fix..
- Added your Signed-off-by to the patch as well.
- Reworded title so it starts with valgrind:

-- 
Bye, Peter Korsgaard
