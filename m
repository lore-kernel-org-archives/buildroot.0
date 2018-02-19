From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 20:34:31 +0100
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump version to
 10.1.31
In-Reply-To: <20180219142339.2372-1-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 19 Feb 2018 06:23:39 -0800")
References: <20180219142339.2372-1-bluemrp9@gmail.com>
Message-ID: <87371wkc3c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Release notes: https://mariadb.com/kb/en/mariadb-10131-release-notes/
 > Changelog: https://mariadb.com/kb/en/mariadb-10131-changelog/

 > Fixes the following security vulnerabilities:

 > CVE-2018-2562 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server : Partition). Supported versions that are affected are
 > 5.5.58 and prior, 5.6.38 and prior and 5.7.19 and prior. Easily exploitable
 > vulnerability allows low privileged attacker with network access via multiple
 > protocols to compromise MySQL Server. Successful attacks of this vulnerability
 > can result in unauthorized ability to cause a hang or frequently repeatable
 > crash (complete DOS) of MySQL Server as well as unauthorized update, insert or
 > delete access to some of MySQL Server accessible data.

 > CVE-2018-2622 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DDL). Supported versions that are affected are 5.5.58
 > and prior, 5.6.38 and prior and 5.7.20 and prior. Easily exploitable
 > vulnerability allows low privileged attacker with network access via multiple
 > protocols to compromise MySQL Server. Successful attacks of this vulnerability
 > can result in unauthorized ability to cause a hang or frequently repeatable
 > crash (complete DOS) of MySQL Server.

 > CVE-2018-2640 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Optimizer). Supported versions that are affected are
 > 5.5.58 and prior, 5.6.38 and prior and 5.7.20 and prior. Easily exploitable
 > vulnerability allows low privileged attacker with network access via multiple
 > protocols to compromise MySQL Server. Successful attacks of this vulnerability
 > can result in unauthorized ability to cause a hang or frequently repeatable
 > crash (complete DOS) of MySQL Server.

 > CVE-2018-2665 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Optimizer). Supported versions that are affected are
 > 5.5.58 and prior, 5.6.38 and prior and 5.7.20 and prior. Easily exploitable
 > vulnerability allows low privileged attacker with network access via multiple
 > protocols to compromise MySQL Server. Successful attacks of this vulnerability
 > can result in unauthorized ability to cause a hang or frequently repeatable
 > crash (complete DOS) of MySQL Server.

 > CVE-2018-2668 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Optimizer). Supported versions that are affected are
 > 5.5.58 and prior, 5.6.38 and prior and 5.7.20 and prior. Easily exploitable
 > vulnerability allows low privileged attacker with network access via multiple
 > protocols to compromise MySQL Server. Successful attacks of this vulnerability
 > can result in unauthorized ability to cause a hang or frequently repeatable
 > crash (complete DOS) of MySQL Server.

 > CVE-2018-2612 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.6.38 and
 > prior and 5.7.20 and prior. Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized creation, deletion or modification access to critical data or all
 > MySQL Server accessible data and unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
