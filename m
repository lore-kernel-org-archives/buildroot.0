From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:40:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 10.3.22
In-Reply-To: <20200204181851.26394-1-bluemrp9@gmail.com> (Ryan Coe's message
 of "Tue, 4 Feb 2020 10:18:51 -0800")
References: <20200204181851.26394-1-bluemrp9@gmail.com>
Message-ID: <87sgigosdy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Release notes:
 > https://mariadb.com/kb/en/library/mariadb-10322-release-notes/

 > Changelog:
 > https://mariadb.com/kb/en/library/mariadb-10322-changelog/

 > Fixes the following security vulnerability (10.3.22):
 > CVE-2020-2574 - Vulnerability in the MySQL Client product of Oracle MySQL
 > (component: C API). Supported versions that are affected are 5.6.46 and
 > prior, 5.7.28 and prior and 8.0.18 and prior. Difficult to exploit
 > vulnerability allows unauthenticated attacker with network access via
 > multiple protocols to compromise MySQL Client. Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Client.

 > Fixes the following security vulnerabilities (10.3.19):
 > CVE-2019-2974 - Vulnerability in the MySQL Server product of Oracle MySQL
 > (component: Server: Optimizer). Supported versions that are affected are
 > 5.6.45 and prior, 5.7.27 and prior and 8.0.17 and prior. Easily exploitable
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server. Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2019-2938 - Vulnerability in the MySQL Server product of Oracle MySQL
 > (component: InnoDB). Supported versions that are affected are 5.7.27 and
 > prior and 8.0.17 and prior. Difficult to exploit vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server. Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > Patch 0002-fix-build-error-with-newer-cmake.patch has been removed as it
 > has been applied upstream.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
