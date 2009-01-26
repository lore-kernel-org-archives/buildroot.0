From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 19:37:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090126193754.BF353768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 19:37:54 +0000 (Mon, 26 Jan 2009)
New Revision: 25061

Log:
Fix spelling error in Makefile comment

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-26 19:19:10 UTC (rev 25060)
+++ trunk/buildroot/Makefile	2009-01-26 19:37:54 UTC (rev 25061)
@@ -12,7 +12,7 @@
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 # General Public License for more details.
-#
+#pathe
 # You should have received a copy of the GNU General Public License
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
@@ -213,7 +213,7 @@
 endif
 TARGETS:=
 
-# setup our pathes
+# setup our paths
 include project/Makefile.in
 
 BR2_DEPENDS_DIR=$(PROJECT_BUILD_DIR)/buildroot-config
