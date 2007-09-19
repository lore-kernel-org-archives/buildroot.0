From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 14:13:50 +0200
Subject: [Buildroot] improper configuration in several packages
Message-ID: <20070919121350.GA14507@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf,

About all packages that you added have a bug when calling configure. It
is mandatory to rm -f config.cache before calling configure.

TIA for fixing that.
