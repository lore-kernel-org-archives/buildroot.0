From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2015 23:10:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/softether: Fix build error on
	ARC
In-Reply-To: <1428004759-25894-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Thu, 2 Apr 2015 21:59:18 +0200")
References: <1428004759-25894-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87384ip77b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > ifaddrs.h is not included in the toolchain, this patch informs softether about this.
 > Fixes
 > http://autobuild.buildroot.net/results/199/19992951da34a703a476dc62ea92e12927c8a02d/
 > http://autobuild.buildroot.net/results/fa7/fa77579aa6502ef1d84976d355637513f38c39c9/
 > http://autobuild.buildroot.net/results/ec8/ec853d4b8d8e91d6d3cdb46bcc15a400d2fcd5d8/
 > http://autobuild.buildroot.net/results/e13/e13ee90bd15a7bba99b3c54de596c8fcb14e60c0/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Hmm, I wanted to apply both patches, but the patch doesn't seem to apply
(dos/unix newlines issue perhaps?)

Applying 0007-arc.patch using patch: 
patching file src/Mayaqua/Mayaqua.h
Hunk #1 FAILED at 235 (different line endings).
1 out of 1 hunk FAILED -- saving rejects to file src/Mayaqua/Mayaqua.h.rej
Patch failed!  Please fix 0007-arc.patch!

-- 
Bye, Peter Korsgaard
