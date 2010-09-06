From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Sep 2010 09:37:47 +0200
Subject: [Buildroot] [PATCH] bump kernel headers to latest stable,
	including scsi patch for latests kernel headers
In-Reply-To: <1283626182-28176-1-git-send-email-marcus.osdoba@googlemail.com>
	(Marcus Osdoba's message of "Sat, 4 Sep 2010 20:49:42 +0200")
References: <1283626182-28176-1-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <87fwxntj90.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Osdoba <marcus.osdoba@googlemail.com> writes:

 Marcus> bump to latest (begin of September 2010) kernel headers,

Thanks, but something seems to have gotten wrong, git am cannot apply
it. I've made the bump myself and at the same time removed
2.6.27/2.6.28.

 Marcus> scsi.h and scsi_net.h have not changed since April 2010
 Marcus> so renaming the scsi patches files in toolchain/kernel-headers/
 Marcus> to match higher versions

Yeah, the fix is finally in mainline for 2.6.36.

-- 
Bye, Peter Korsgaard
