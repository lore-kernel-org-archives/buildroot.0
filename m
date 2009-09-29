From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Sep 2009 11:48:23 +0200
Subject: [Buildroot] [PATCH] Add Swfdec Free flash library
In-Reply-To: <1254135823-15969-1-git-send-email-riou.emmanuel@googlemail.com>
	(Emmanuel Riou's message of "Mon\, 28 Sep 2009 12\:03\:43 +0100")
References: <1254135823-15969-1-git-send-email-riou.emmanuel@googlemail.com>
Message-ID: <87ocouozdk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Emmanuel" == Emmanuel Riou <riou.emmanuel@googlemail.com> writes:

 Emmanuel> Signed-off-by: Emmanuel Riou <riou.emmanuel@googlemail.com>

Thanks - There was still a few issues, but I fixed it up and committed:

- pango + cairo png needed by base package
- libsoup only needed for gtk option
- typo in makefile (ohost-pkgconfig)

-- 
Bye, Peter Korsgaard
