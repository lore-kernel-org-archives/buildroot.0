From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 14:00:32 +0200
Subject: [Buildroot] [PATCH v2] Allow setting the password for user
	default
In-Reply-To: <538F070E.7000705@relinux.de> (Stephan Hoffmann's message of
 "Wed, 04 Jun 2014 13:46:22 +0200")
References: <1401787751-32600-1-git-send-email-sho@relinux.de>
 <87ppipossk.fsf@dell.be.48ers.dk> <538F070E.7000705@relinux.de>
Message-ID: <87lhtcq3z3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

Hi,

 >> Do you have any use case for keeping it instead of just using
 >> BR2_ROOTFS_USERS_TABLES?
 > No, so we shall drop this patch. I can also cook a patch that removes
 > the old default user, because I definitively do not want to have it
 > without the possibility to give it a password easily.

Yes, please do - Thanks!

-- 
Bye, Peter Korsgaard
