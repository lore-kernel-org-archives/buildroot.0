From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Nov 2010 17:23:13 +0100
Subject: [Buildroot] [PATCH] linux: update paths to compiled cpio files
In-Reply-To: <1289918350-17559-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Tue, 16 Nov 2010 09:39:10 -0500")
References: <1289918350-17559-1-git-send-email-vapier@gentoo.org>
Message-ID: <874obfc426.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Linux has been using "usr/initramfs_data.cpio" for a few releases as the
 Mike> generated cpio name, so the buildroot match of "...cpio.*" won't actually
 Mike> clean out the previous result.

 Mike> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
