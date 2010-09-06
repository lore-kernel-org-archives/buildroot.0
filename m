From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Mon, 06 Sep 2010 09:50:33 +0200
Subject: [Buildroot] [PATCH] bump kernel headers to latest stable,
 including scsi patch for latests kernel headers
In-Reply-To: <87fwxntj90.fsf@macbook.be.48ers.dk>
References: <1283626182-28176-1-git-send-email-marcus.osdoba@googlemail.com>
	<87fwxntj90.fsf@macbook.be.48ers.dk>
Message-ID: <4C849D49.2040002@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 06.09.2010 09:37, schrieb Peter Korsgaard:
> Thanks, but something seems to have gotten wrong, git am cannot apply
> it. I've made the bump myself and at the same time removed
> 2.6.27/2.6.28.
I'm using git of the current debian squeeze (which ist 1.7.1 or so). I 
used the built in git feature:
git format-patch
and
git send-email with the formerly generated patch

I have other patches in branch which introduce util-linux-ng. Can you 
give the output of the git am error?
Does this patch 
(http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/24766) cause 
the same error?

>   Marcus>  scsi.h and scsi_net.h have not changed since April 2010
>   Marcus>  so renaming the scsi patches files in toolchain/kernel-headers/
>   Marcus>  to match higher versions
>
> Yeah, the fix is finally in mainline for 2.6.36.
;-)
