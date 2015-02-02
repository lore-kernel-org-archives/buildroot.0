From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Feb 2015 00:02:43 +0100
Subject: [Buildroot] [PATCH 2/2] automake: use whenever possible the
	ACLOCAL_DIR variable
In-Reply-To: <1422809500-23948-2-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Sun, 1 Feb 2015 17:51:40 +0100")
References: <1422809500-23948-1-git-send-email-fabio.porcedda@gmail.com>
 <1422809500-23948-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87twz3gbn0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Use the ACLOCAL_DIR in the GTK_DOC_M4_INSTALL hook.
 > Move the ACLOCAL_DIR definition at the beginning so the definition is
 > ahead the utilization.

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
