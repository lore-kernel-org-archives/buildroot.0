From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jun 2018 16:41:30 +0200
Subject: [Buildroot] [git commit] mariadb: security bump version to 10.1.33
Message-ID: <20180609144026.2AB2B8634B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fbacdd59fd43c47f7031922e9fbae4d316a296f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://mariadb.com/kb/en/mariadb-10133-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10133-changelog/

Fixes the following security vulnerabilities:

CVE-2018-2782 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB).  Supported versions that are affected are 5.6.39 and
prior and 5.7.21 and prior.  Easily exploitable vulnerability allows low
privileged attacker with network access via multiple protocols to compromise
MySQL Server.  Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server.

CVE-2018-2784 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB).  Supported versions that are affected are 5.6.39 and
prior and 5.7.21 and prior.  Easily exploitable vulnerability allows low
privileged attacker with network access via multiple protocols to compromise
MySQL Server.  Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server.

CVE-2018-2787 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB).  Supported versions that are affected are 5.6.39 and
prior and 5.7.21 and prior.  Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server.  Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server as well as unauthorized update, insert or
delete access to some of MySQL Server accessible data.

CVE-2018-2766 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB).  Supported versions that are affected are 5.6.39 and
prior and 5.7.21 and prior.  Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server.  Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server.

CVE-2018-2755 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Replication).  Supported versions that are affected
are 5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Difficult to
exploit vulnerability allows unauthenticated attacker with logon to the
infrastructure where MySQL Server executes to compromise MySQL Server.
Successful attacks require human interaction from a person other than the
attacker and while the vulnerability is in MySQL Server, attacks may
significantly impact additional products.  Successful attacks of this
vulnerability can result in takeover of MySQL Server.

CVE-2018-2819 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB).  Supported versions that are affected are 5.5.59 and
prior, 5.6.39 and prior and 5.7.21 and prior.  Easily exploitable
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2018-2817 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: DDL).  Supported versions that are affected are
5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Easily exploitable
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2018-2761 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Client programs).  Supported versions that are affected are
5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Difficult to
exploit vulnerability allows unauthenticated attacker with network access
via multiple protocols to compromise MySQL Server.  Successful attacks of
this vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2018-2781 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Optimizer).  Supported versions that are affected are
5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Easily exploitable
vulnerability allows high privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2018-2771 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Locking).  Supported versions that are affected are
5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Difficult to
exploit vulnerability allows high privileged attacker with network access
via multiple protocols to compromise MySQL Server.  Successful attacks of
this vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2018-2813 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: DDL).  Supported versions that are affected are
5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Easily exploitable
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized read access to a subset of MySQL
Server accessible data.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index b8b2dde374..7eea62ab7b 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.1.32/
-sha256 0e2aae6a6a190d07c8e36e87dd43377057fa82651ca3c583462563f3e9369096  mariadb-10.1.32.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.33/
+sha256 94312c519f2c0c25e1964c64e22aff0036fb22dfb2685638f43a6b2211395d2d  mariadb-10.1.33.tar.gz
 
 # Hash for license files
 sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 391655fb0a..ce846d9cda 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.32
+MARIADB_VERSION = 10.1.33
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
