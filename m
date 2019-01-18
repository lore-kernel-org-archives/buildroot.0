From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 15:58:48 +0100
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump version to
 10.3.11
In-Reply-To: <20181229011219.851-1-bluemrp9@gmail.com> (Ryan Coe's message of
 "Fri, 28 Dec 2018 17:12:19 -0800")
References: <20181229011219.851-1-bluemrp9@gmail.com>
Message-ID: <877ef23tcn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Remove 0002-cmake-fix-ucontext-dection.path as it is now upstream.
 > Hash updated for README.md because upstream changed bug report links.

 > Release notes: https://mariadb.com/kb/en/mariadb-10311-release-notes/
 > Changelog: https://mariadb.com/kb/en/mariadb-10311-changelog/

 > Fixes the following security vulnerabilities:

 > CVE-2018-3282 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Storage Engines). Supported versions that are affected
 > are 5.5.61 and prior, 5.6.41 and prior, 5.7.23 and prior and 8.0.12 and prior.
 > Easily exploitable vulnerability allows high privileged attacker with network
 > access via multiple protocols to compromise MySQL Server. Successful attacks
 > of this vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2016-9843 - The crc32_big function in crc32.c in zlib 1.2.8 might allow
 > context-dependent attackers to have unspecified impact via vectors involving
 > big-endian CRC calculation.

 > CVE-2018-3174 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Client programs). Supported versions that are affected are
 > 5.5.61 and prior, 5.6.41 and prior, 5.7.23 and prior and 8.0.12 and prior.
 > Difficult to exploit vulnerability allows high privileged attacker with logon
 > to the infrastructure where MySQL Server executes to compromise MySQL Server.
 > While the vulnerability is in MySQL Server, attacks may significantly impact
 > additional products. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash (complete
 > DOS) of MySQL Server.

 > CVE-2018-3143 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.6.41 and
 > prior, 5.7.23 and prior and 8.0.12 and prior. Easily exploitable vulnerability
 > allows low privileged attacker with network access via multiple protocols to
 > compromise MySQL Server. Successful attacks of this vulnerability can result
 > in unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > CVE-2018-3156 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.6.41 and
 > prior, 5.7.23 and prior and 8.0.12 and prior. Easily exploitable vulnerability
 > allows low privileged attacker with network access via multiple protocols to
 > compromise MySQL Server. Successful attacks of this vulnerability can result
 > in unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > CVE-2018-3251 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.6.41 and
 > prior, 5.7.23 and prior and 8.0.12 and prior. Easily exploitable vulnerability
 > allows low privileged attacker with network access via multiple protocols to
 > compromise MySQL Server. Successful attacks of this vulnerability can result
 > in unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > CVE-2018-3185 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
 > prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash (complete
 > DOS) of MySQL Server as well as unauthorized update, insert or delete access
 > to some of MySQL Server accessible data. CVSS 3.0 Base Score 5.5 (Integrity
 > and Availability impacts).

 > CVE-2018-3277 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
 > prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash (complete
 > DOS) of MySQL Server.

 > CVE-2018-3162 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
 > prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash (complete
 > DOS) of MySQL Server.

 > CVE-2018-3173 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
 > prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash (complete
 > DOS) of MySQL Server.

 > CVE-2018-3200 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
 > prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash (complete
 > DOS) of MySQL Server.

 > CVE-2018-3284 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
 > prior and 8.0.12 and prior. Difficult to exploit vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash (complete
 > DOS) of MySQL Server.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
