From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Feb 2011 22:48:55 +0100
Subject: [Buildroot] [PATCH 1/2] Update to the latest GStreamer packages
In-Reply-To: <1296843913-22321-2-git-send-email-felipe.contreras@gmail.com>
	(Felipe Contreras's message of "Fri, 4 Feb 2011 20:25:12 +0200")
References: <1296843913-22321-1-git-send-email-felipe.contreras@gmail.com>
	<1296843913-22321-2-git-send-email-felipe.contreras@gmail.com>
Message-ID: <8739o3qxmg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

 Felipe> liboil is not needed not used any more. orc _can_ be used instead, but
 Felipe> it's not needed.

Committed, thanks. You forgot to remove the select BR2_PACKAGE_LIBOIL,
but I did that.

Just to be sure - With these version bumps the fixes for make 3.82 are
no longer needed, right?

-- 
Bye, Peter Korsgaard
