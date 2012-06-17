From: Nathan Lynch <ntl@pobox.com>
Date: Sun, 17 Jun 2012 16:53:58 -0500
Subject: [Buildroot] [PATCH 0/3] Document use of local sources for packages
Message-ID: <1339970041-17398-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the 2011.11 release Buildroot has supported building packages
from local sources, but the manual has not reflected this well.  This
series is an attempt to address that.  I relied on Thomas Petazzoni's
description of the "file" and "local" methods here:

http://free-electrons.com/blog/buildroot-2011-11/

Nathan Lynch (3):
  docs: update LIBFOO_SITE to describe use of filesystem paths
  docs: rework LIBFOO_SITE_METHOD documentation
  docs: describe "file" and "local" methods in LIBFOO_SITE_METHOD

 docs/manual/adding-packages-gentargets.txt |   77 +++++++++++++++++++---------
 1 file changed, 52 insertions(+), 25 deletions(-)

-- 
1.7.10.2
