From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Nov 2012 11:48:38 +0100
Subject: [Buildroot] [PATCH] cpio/initramfs: clarify their use in the
	help text
In-Reply-To: <1352245308-10348-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 7 Nov 2012 00:41:48 +0100")
References: <1352245308-10348-1-git-send-email-arnout@mind.be>
Message-ID: <87vcdhelix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Recent mails on the list show that it is not very clear how to create
 Arnout> an initial RAM fs with buildroot.  So make this more explicit in the
 Arnout> cpio and initramfs help texts.  Hopefully this will reduce the /init
 Arnout> debugging we have to do.

Committed, thanks.

-- 
Bye, Peter Korsgaard
