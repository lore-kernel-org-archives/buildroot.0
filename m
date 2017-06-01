From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:06:54 +0200
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump to version
	10.1.23
In-Reply-To: <20170508153716.16809-1-bluemrp9@gmail.com> (Ryan Coe's message
 of "Mon, 8 May 2017 08:37:16 -0700")
References: <20170508153716.16809-1-bluemrp9@gmail.com>
Message-ID: <87shjjls3l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Fixes:
 > CVE-2017-3302 - Crash in libmysqlclient.so in Oracle MySQL before 5.6.21 and
 > 5.7.x before 5.7.5 and MariaDB through 5.5.54, 10.0.x through 10.0.29,
 > 10.1.x through 10.1.21, and 10.2.x through 10.2.3.

 > CVE-2017-3313 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: MyISAM). Supported versions that are affected are
 > 5.5.53 and earlier, 5.6.34 and earlier and 5.7.16 and earlier. Difficult to
 > exploit vulnerability allows low privileged attacker with logon to the
 > infrastructure where MySQL Server executes to compromise MySQL Server.
 > Successful attacks of this vulnerability can result in unauthorized access
 > to critical data or complete access to all MySQL Server accessible data.

 > CVE-2017-3308 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DML). Supported versions that are affected are 5.5.54
 > and earlier, 5.6.35 and earlier and 5.7.17 and earlier. Easily "exploitable"
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server. While the vulnerability is
 > in MySQL Server, attacks may significantly impact additional products.
 > Successful attacks of this vulnerability can result in unauthorized
 > ability to cause a hang or frequently repeatable crash (complete DOS) of
 > MySQL Server.

 > CVE-2017-3309 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Optimizer). Supported versions that are affected are
 > 5.5.54 and earlier, 5.6.35 and earlier and 5.7.17 and earlier. Easily
 > "exploitable" vulnerability allows low privileged attacker with network
 > access via multiple protocols to compromise MySQL Server. While the
 > vulnerability is in MySQL Server, attacks may significantly impact
 > additional products. Successful attacks of this vulnerability can result
 > in unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > CVE-2017-3453 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Optimizer). Supported versions that are affected are
 > 5.5.54 and earlier, 5.6.35 and earlier and 5.7.17 and earlier. Easily
 > "exploitable" vulnerability allows low privileged attacker with network
 > access via multiple protocols to compromise MySQL Server. Successful attacks
 > of this vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2017-3456 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DML). Supported versions that are affected are 5.5.54
 > and earlier, 5.6.35 and earlier and 5.7.17 and earlier. Easily "exploitable"
 > vulnerability allows high privileged attacker with network access via
 > multiple protocols to compromise MySQL Server. Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2017-3464 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DDL). Supported versions that are affected are 5.5.54
 > and earlier, 5.6.35 and earlier and 5.7.17 and earlier. Easily "exploitable"
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server. Successful attacks of this
 > vulnerability can result in unauthorized update, insert or delete access to
 > some of MySQL Server accessible data.

 > And a number of important, but non-security related fixes:

 > MDEV-12602: Fixed some race conditions in InnoDB encryption

 > MariaDB Backup alpha introduced

 > Galera wsrep library updated to 25.3.20

 > For details, see the release notes:
 > https://mariadb.com/kb/en/mariadb/mariadb-10123-release-notes/

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
