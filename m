From: Cameron Hutchison <lists@xdna.net>
Date: Mon, 01 Feb 2010 00:51:41 -0000
Subject: [Buildroot] Fetching kernel via git
Message-ID: <66a1.4b66259d.a7107@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there some way to configure buildroot to fetch the kernel sources
via git?

I am currently downloading my third complete kernel source tree for
2.6.32.7, previously having downloaded 2.6.23.3 and 2.6.31.6.

I keep a git repository with a clone of Linus's public tree and the
stable trees, so it would save greatly on bandwidth and time if
buildroot could clone the kernel from that local repository instead of
downloading a source tarball every time the extraversion bumps up a
version.
