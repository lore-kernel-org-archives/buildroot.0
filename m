From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 07 Oct 2013 08:50:06 +0200
Subject: [Buildroot] [PATCH 0 of 2 v3] manual generation: misc changes
Message-ID: <patchbomb.1381128606@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: fix make release in first patch

 Makefile                                    |   4 +-
 docs/manual/make-tips.txt                   |   3 +-
 docs/manual/manual.mk                       |  34 ++++++++++++++++++++++-
 docs/manual/prerequisite.txt                |   5 ++-
 support/dependencies/check-host-asciidoc.sh |  36 +++++++++++++++++++++++++
 5 files changed, 75 insertions(+), 7 deletions(-)
