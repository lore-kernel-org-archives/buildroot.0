From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 May 2019 15:38:23 +0200
Subject: [Buildroot] [git commit] package/systemd: fix patch order
Message-ID: <20190501133405.AD3E784614@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29d6181885000c2e9d4475bb686f3ae57f3508ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename 0002-install-don-t-use-ln-relative.patch to
0001-install-don-t-use-ln-relative.patch as there is two 0002-xxx
patches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...n-t-use-ln-relative.patch => 0001-install-don-t-use-ln-relative.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/systemd/0002-install-don-t-use-ln-relative.patch b/package/systemd/0001-install-don-t-use-ln-relative.patch
similarity index 100%
rename from package/systemd/0002-install-don-t-use-ln-relative.patch
rename to package/systemd/0001-install-don-t-use-ln-relative.patch
