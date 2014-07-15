From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:40:07 +0200
Subject: [Buildroot] [git commit] give a hint about git rebase
Message-ID: <20140715214023.85F119D24C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b41ec531c2be1b57712cf1c7402842348cd5b5b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems common knowledge to use git rebase in interactive mode
to fixup issues while respinning patch series, but I found it hard
to find any hint about it. Add a note for git beginners like me.

[Thomas: take into account Arnout's comment.]

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 54da102..12e7f98 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -222,6 +222,9 @@ should include a changelog of the modifications between each
 submission. Note that when your patch series is introduced by a cover
 letter, an overall changelog may be added to the cover letter in
 addition to the changelog in the individual commits.
+The best thing to rework a patch series is by interactive rebasing:
++git rebase -i origin/master+. Consult the git manual for more
+information.
 
 When added to the individual commits, this changelog is added when
 editing the commit message.  Below the +Signed-off-by+ section, add
