From: MikeW <mw_phil@yahoo.co.uk>
Date: Mon, 20 Nov 2006 15:46:14 +0000 (UTC)
Subject: [Buildroot] Boost package settings for using cross-compiler ?
Message-ID: <loom.20061120T163936-97@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I successfully (so I thought) created a package file for building the Boost C++
libraries under buildroot, but when I came to use them, found they had been
built using native (i386) tools, unlike the rest of the libraries built
by Buildroot, which were ARM architecture.

The top-level Boost config parameters do not appear to have a tool
prefix or macro to support cross-tools.

So - has anyone built Boost successfully before ?

I imagine that if so, the distribution would already contain
a package file for the library ...

Regards,
Mike
