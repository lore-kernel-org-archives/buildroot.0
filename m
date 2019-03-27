From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 16:02:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/mariadb: bump version to 10.3.13
In-Reply-To: <20190319234719.9109-1-bluemrp9@gmail.com> (Ryan Coe's message of
 "Tue, 19 Mar 2019 16:47:19 -0700")
References: <20190319234719.9109-1-bluemrp9@gmail.com>
Message-ID: <87sgv8qs10.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Release notes:
 > https://mariadb.com/kb/en/library/mariadb-10313-release-notes/

 > Changelog:
 > https://mariadb.com/kb/en/mariadb-10313-changelog/

 > Fixes the following security vulnerabilities:

 > CVE-2019-2510 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB). Supported versions that are affected are 5.7.24 and
 > prior and 8.0.13 and prior. Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > CVE-2019-2537 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DDL). Supported versions that are affected are 5.6.42
 > and prior, 5.7.24 and prior and 8.0.13 and prior. Easily exploitable
 > vulnerability allows high privileged attacker with network access via
 > multiple protocols to compromise MySQL Server. Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > Note that the hash for README.md changed due to Travis CI and Appveyor CI
 > updates.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2018.11.x and 2019.02.x, thanks.

For 2018.02.x I will instead bump the version to 10.1.38.

-- 
Bye, Peter Korsgaard
