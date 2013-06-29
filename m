From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Jun 2013 21:03:43 +0200
Subject: [Buildroot] [PATCH] dbus: ensure directory exists before
	installing symlink
In-Reply-To: <1372512424-26165-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sat, 29 Jun 2013 09:27:04 -0400")
References: <1372512424-26165-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <8738s0yc1c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> If you use a custom target skeleton with no /var/lib directory,
 Danomi> then the symlink installation in dbus.mk will fail.  This patch
 Danomi> fixes this issue by creating /var/lib before creating a symlink
 Danomi> there.

Committed, thanks.

-- 
Bye, Peter Korsgaard
