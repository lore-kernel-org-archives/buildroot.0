From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 24 Apr 2013 12:08:54 +0200
Subject: [Buildroot] [RFC 0/4] fixes for top-level parallel make
Message-ID: <1366798138-30722-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set improve support for top-level parallel make,
the support for top-level parallel make is not complete, but at least
is a improvement.
I will submit a more complete patch set with more fixes.

Best regards
Fabio Porcedda (4):
  package: add toolchain dependency to inner-generic-package
  package: fix generic configure for top-level parallel make
  package: fix generic build for top-level parallel make
  package: fix generic install for top-level parallel make

 package/pkg-autotools.mk |  2 +-
 package/pkg-generic.mk   | 33 ++++++++++++++++++---------------
 2 files changed, 19 insertions(+), 16 deletions(-)

-- 
1.8.1.4
