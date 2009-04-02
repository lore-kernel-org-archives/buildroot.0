From: Michael Roth <mroth@nessie.de>
Date: Thu, 02 Apr 2009 11:32:48 +0200
Subject: [Buildroot] [PATCH] libusb: Fix host autotools dependency
In-Reply-To: <20090402012420.GF29488@cloud.net.au>
References: <1238533954-31225-1-git-send-email-mroth@nessie.de>
	<20090402012420.GF29488@cloud.net.au>
Message-ID: <49D48640.5020703@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> What does this fix?

Problem was, that autotools were not build because $(AUTOCONF),
$(AUTOMAKE) and $(LIBTOOL) don't have any dependency.

Maybe I should make the commit messages more explicit.


> I had lots of problems with libusb being rebuilt every time a while ago
> with a change like the above. It might be better now with $(HOST_DIR)
> etc. Please check.

Hmm. I will check this.
