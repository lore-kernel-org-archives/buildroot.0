From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 10:19:39 +0100
Subject: [Buildroot] [PATCH] package/Makefile.in: remove
	BR2_TARGET_OPTIMIZATION from TARGET_CFLAGS
In-Reply-To: <1444861150-4972-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 15 Oct 2015 00:19:10 +0200")
References: <1444861150-4972-1-git-send-email-arnout@mind.be>
Message-ID: <871tce58wk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Since the toolchain is always wrapped and the wrapper already passes
 > BR2_TARGET_OPTIMIZATION (through BR_ADDITIONAL_CFLAGS), there is no longer
 > any need to pass it in TARGET_CFLAGS as well.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
