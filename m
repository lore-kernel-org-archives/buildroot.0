From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Nov 2010 21:21:28 +0100
Subject: [Buildroot] [PATCH v2] initramfs: fix init symlink creation
In-Reply-To: <1289976382-22357-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Wed, 17 Nov 2010 01:46:22 -0500")
References: <1289919526-2227-1-git-send-email-vapier@gentoo.org>
	<1289976382-22357-1-git-send-email-vapier@gentoo.org>
Message-ID: <87sjyzaegn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The -e test will dereference the symlink, so if there is no /bin/init,
 Mike> we will constantly try to create the symlink.  So rather than error on
 Mike> subsequent runs when the link exists, use the force flag to ln.

Committed, thanks.

-- 
Bye, Peter Korsgaard
