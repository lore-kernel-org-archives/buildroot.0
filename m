From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Mar 2015 19:12:03 +0100
Subject: [Buildroot] [git commit] agentpp: update .hash file
Message-ID: <20150323181207.D9C96817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc6b36b6bad9eb9c7590eb68f47d95c540af55fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the .hash file because the .tar.gz file has been regenerated.
The contents was not changed so just updating the .hash file is fine.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/agentpp/agentpp.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 663e170..7c48044 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha512 edd9f839c33ab7287d16605249dd9d6e639fb33f48d1894b8ea8b468bb53dbd733f137f6556cb3f6e28a3806f115896a1b8401235c6441d628064edb50f057b4 agent++-4.0.3.tar.gz
+sha512 636e19a7bbc3cfbf6f1ac10d29ddd378ca81b5525be1bd09c26a1cbd20ff9cfc3d4406329147bf20994f0d59bbdb675e99e82de3837eb898a145439c5054ef96 agent++-4.0.3.tar.gz
