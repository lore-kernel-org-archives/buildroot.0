From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 09:32:32 +0100
Subject: [Buildroot] [git commit] utils/scanpypi: remind developer about
 updating DEVELOPERS and Config.in
Message-ID: <20191226082330.93B598E57D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f64701b03da220099b8c15361fed6f3034b6d469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scanpypi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index 796ce1d60c..387755bbb8 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -742,6 +742,8 @@ def main():
             package.create_hash_file()
 
             package.create_config_in()
+            print("NOTE: Remember to also make an update to the DEVELOPERS file")
+            print("      and include an entry for the pkg in packages/Config.in")
             print()
             # printing an empty line for visual confort
     finally:
