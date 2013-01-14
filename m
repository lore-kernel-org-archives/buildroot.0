From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 16:33:18 +0100
Subject: [Buildroot] [PATCH] libelementary: only use libethumb if
	libedbus is available.
In-Reply-To: <1358171105-8786-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 14 Jan 2013 14:45:05 +0100")
References: <87mwwdz9k2.fsf@dell.be.48ers.dk>
 <1358171105-8786-1-git-send-email-arnout@mind.be>
Message-ID: <87hamjsrsx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Arnout> libelementary uses the ethumb_client library, but that one is
 Arnout> only built if libedbus is available. So fixup the
 Arnout> --enable/disable-ethumb according to the selection of
 Arnout> BR2_PACKAGE_LIBEDBUS.

 Arnout> Fixes e.g.
 Arnout> http://autobuild.buildroot.net/results/14ef98da6b0632e24514fef696fae9a650c90c96

Committed, thanks.

-- 
Bye, Peter Korsgaard
