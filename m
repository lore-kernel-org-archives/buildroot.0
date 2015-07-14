From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 14 Jul 2015 17:17:20 +0200
Subject: [Buildroot] [PATCH v4 1/7] docs/manual: Fix trivial typo
In-Reply-To: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
Message-ID: <20150714171720.5e057e07@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 docs/manual/adding-packages-python.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index f81d625..588dbf8 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -143,7 +143,7 @@ therefore only use a few of them, or none.
 * +HOST_PYTHON_FOO_NEEDS_HOST_PYTHON+, to define the host python
   interpreter. The usage of this variable is limited to host
   packages. The two supported value are +python2+ and +python3+. It
-  will ensures the right host python package is available and will
+  will ensure the right host python package is available and will
   invoke it for the build. If some build steps are overloaded, the
   right python interpreter must be explicitly called in the commands.
 
-- 
2.4.5




-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech                    Phone:  +420 606 201 868
   Brno, Czech Republic
