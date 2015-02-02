From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Feb 2015 00:01:22 +0100
Subject: [Buildroot] [PATCH 1/2] automake: complete the removal of the
	target package
In-Reply-To: <1422809500-23948-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Sun, 1 Feb 2015 17:51:39 +0100")
References: <1422809500-23948-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87y4ofgbp9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > The variable ACLOCAL_DIR points to the staging area but is not useful
 > anymore because the target package was removed.  Fix ACLOCAL_DIR by
 > pointing to $(HOST_DIR)/usr/share/aclocal and remove ACLOCAL_HOST_DIR
 > because ACLOCAL_DIR has the same value so it's not useful anymore.

 > Also remove the reference to ACLOCAL_HOST_DIR from the host-autoconf
 > package.

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
