From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Feb 2013 16:54:04 +0100
Subject: [Buildroot] [PATCH 1/1] port the patch from uClibc 0.9.33.1 to
	0.9.33.2
In-Reply-To: <1360847701-27267-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Thu, 14 Feb 2013 14:15:01 +0100")
References: <1360847701-27267-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87vc9nhtgj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Port the linuxthreads-errno-fix path to uclibc 0.9.33.2
 Sagaert> Without this patch programs using libglib2 (libsoup, etc.. ) and pthread may be broken.

Committed, thanks.

-- 
Bye, Peter Korsgaard
