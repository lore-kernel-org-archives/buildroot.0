From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Mar 2014 17:24:26 +0100
Subject: [Buildroot] [PATCH 0 of 8] manual: rework Contributing chapter
Message-ID: <patchbomb.1394036666@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch series reworks the "Contributing to Buildroot" chapter in the
manual. According to the latest Buildroot Developer Days, we want to promote
contributions that are not feature patches, like fixing autobuild failures,
closing bugs, working on items from the TODO list, etc. This series reorders
and expands the chapter with that desire in mind.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/contribute.txt |  334 ++++++++++++++++++++++++----------------
 1 files changed, 196 insertions(+), 138 deletions(-)
