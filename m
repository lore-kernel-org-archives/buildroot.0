From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 09:03:16 +0200
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump version to
	10.1.26
In-Reply-To: <20170822140726.2232-1-bluemrp9@gmail.com> (Ryan Coe's message of
 "Tue, 22 Aug 2017 07:07:26 -0700")
References: <20170822140726.2232-1-bluemrp9@gmail.com>
Message-ID: <871snnosi3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Release notes: https://mariadb.com/kb/en/mariadb-10126-release-notes/
 > Changelog: https://mariadb.com/kb/en/mariadb-10126-changelog/

 > Fixes the following security vulnerabilities:

 > CVE-2017-3636 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Client programs). Supported versions that are affected are
 > 5.5.56 and earlier and 5.6.36 and earlier. Easily exploitable vulnerability
 > allows low privileged attacker with logon to the infrastructure where MySQL
 > Server executes to compromise MySQL Server. Successful attacks of this
 > vulnerability can result in unauthorized update, insert or delete access to
 > some of MySQL Server accessible data as well as unauthorized read access to
 > a subset of MySQL Server accessible data and unauthorized ability to cause
 > a partial denial of service (partial DOS) of MySQL Server.

 > CVE-2017-3641 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DML). Supported versions that are affected are
 > 5.5.56 and earlier, 5.6.36 and earlier and 5.7.18 and earlier. Easily
 > exploitable vulnerability allows high privileged attacker with network
 > access via multiple protocols to compromise MySQL Server. Successful
 > attacks of this vulnerability can result in unauthorized ability to cause
 > a hang or frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2017-3653 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DDL). Supported versions that are affected are
 > 5.5.56 and earlier, 5.6.36 and earlier and 5.7.18 and earlier. Difficult
 > to exploit vulnerability allows low privileged attacker with network access
 > via multiple protocols to compromise MySQL Server. Successful attacks of
 > this vulnerability can result in unauthorized update, insert or delete
 > access to some of MySQL Server accessible data.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
