From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Oct 2012 21:40:28 +0200
Subject: [Buildroot] [PATCH v3] sylpheed: Fix includedir
In-Reply-To: <1349649599-12615-1-git-send-email-gvaxon@gmail.com> (Valentine
 Barshak's message of "Mon, 8 Oct 2012 02:39:59 +0400")
References: <1349649599-12615-1-git-send-email-gvaxon@gmail.com>
Message-ID: <87a9vw4us3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Valentine" == Valentine Barshak <gvaxon@gmail.com> writes:

 Valentine> The sylpheed headers are installed to $(DESTDIR)$(includedir),
 Valentine> while DESTDIR is $(TARGET_DIR) and includedir is set to
 Valentine> $(STAGING_DIR)/usr/include in the SYLPHEED_CONF_OPT.
 Valentine> Thus, the full staging directory path is created in the
 Valentine> target root filesystem, which is wrong.

Committed, thanks.

-- 
Bye, Peter Korsgaard
