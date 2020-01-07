From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2020 22:26:09 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] utils/scanpypi: remind
 developer about updating DEVELOPERS and Config.in
Message-ID: <20200107211758.7CDBC839D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c2a2a333518bf0b606d94ef29cb9205bc8de4bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f64701b03da220099b8c15361fed6f3034b6d469)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
