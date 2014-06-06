From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Jun 2014 00:13:10 +0200
Subject: [Buildroot] [PATCH] Remove user "default"
In-Reply-To: <1401957050-24705-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Thu, 5 Jun 2014 10:30:50 +0200")
References: <1401957050-24705-1-git-send-email-sho@relinux.de>
Message-ID: <87d2eln0uh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 > User "default" with no password has been around for long time, but not
 > used within buildroot. Since we now have BR2_ROOTFS_USERS_TABLES it is
 > no longer needed.

 > Signed-off-by: Stephan Hoffmann <sho@relinux.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
