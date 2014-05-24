From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 24 May 2014 22:06:47 +0200
Subject: [Buildroot] [PATCH 0 of 4 v2 for-2014.05] website: some limited
	updates
Message-ID: <patchbomb.1400962007@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



These patches make a few updates to the buildroot website:
- update contribute and support page
- remove references to uclibc.org
- add alt property to img tags (correct html)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/contribute.html |  53 ++++++++++++++++++++--------------------------
 docs/docs.html       |   2 +-
 docs/header.html     |   3 ++-
 docs/index.html      |   3 ++-
 docs/js/buildroot.js |   2 +-
 docs/support.html    |  32 ++++++++++++++++----------------

Note: it seems that lists.buildroot.org forwards to bugs.busybox.net instead
of staying at lists, which makes the list URL unchangeable, currently.
