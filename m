From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 19 Nov 2019 11:15:27 -0600
Subject: [Buildroot] [next] utils/scanpypi: remind developer about updating
 DEVELOPERS and Config.in
Message-ID: <20191119171527.18570-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 utils/scanpypi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index 55b3d1e61c..abb190a536 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -739,6 +739,8 @@ def main():
             package.create_hash_file()
 
             package.create_config_in()
+            print("NOTE: Remember to also make an update to the DEVELOPERS file")
+            print("      and include an entry for the pkg in packages/Config.in")
             print()
             # printing an empty line for visual confort
     finally:
-- 
2.17.1
