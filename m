From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 6 Apr 2010 14:41:05 +0000 (UTC)
Subject: [Buildroot] External toolchain built by buildroot no longer
	supported.
Message-ID: <hpfh61$drp$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of this commit

  http://git.buildroot.org/buildroot/commit/?id=3b7aee23f2ab732f06b8a090ca002fb102d547ee

use of of external toolchains built by buildroot is no longer
possible.

Are we to assume that crosstool-NG is now the "officially supported"
source for external toolchains?

I've been using external toolchains built by buildroot since it's so
much simpler than using crosstool-NG: you don't have to build and
install buildroot like you do crosstool-NG, and I already have
buildroot under source control.  Now I'll also have to place
crosstool-NG (both sources and installed files) under version control.

I'd just as soon stick with using buildroot toolchains, but it's
starting to feel like swimming against the tide.

When I asked a few months ago if there was any reason I shouldn't use
external toolchains built by buildroot, I was told there were none.

Has that changed?

-- 
Grant Edwards               grant.b.edwards        Yow! Will it improve my
                                  at               CASH FLOW?
                              gmail.com            
