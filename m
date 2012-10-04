From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Oct 2012 23:04:17 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove more pkgconfig files
In-Reply-To: <1349203935-20225-1-git-send-email-gvaxon@gmail.com> (Valentine
 Barshak's message of "Tue, 2 Oct 2012 22:52:15 +0400")
References: <1349203935-20225-1-git-send-email-gvaxon@gmail.com>
Message-ID: <871uhe0x0u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Valentine" == Valentine Barshak <gvaxon@gmail.com> writes:

 Valentine> The pkgconfig files are located in  /usr/lib/pkgconfig
 Valentine> and /usr/share/pkgconfig directories.
 Valentine> However, only /usr/lib/pkgconfig is removed when no
 Valentine> development files are needed in the target filesystem.

 Valentine> Remove pkgconfig directory from $(TARGET_DIR)/usr/share
 Valentine> as well if BR2_HAVE_DEVFILES is not set.

Committed, thanks.

-- 
Bye, Peter Korsgaard
