From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 00:06:24 +0100
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump version to
 10.1.29
In-Reply-To: <20171214174157.3354-1-bluemrp9@gmail.com> (Ryan Coe's message of
 "Thu, 14 Dec 2017 09:41:57 -0800")
References: <20171214174157.3354-1-bluemrp9@gmail.com>
Message-ID: <878tdjke8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Release notes: https://mariadb.com/kb/en/mariadb-10129-release-notes/
 > Changelog: https://mariadb.com/kb/en/mariadb-10129-changelog/

 > Fixes the following security vulnerabilities:

 > CVE-2017-10378 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Optimizer). Supported versions that are affected are
 > 5.5.57 and earlier, 5.6.37 and earlier and 5.7.11 and earlier. Easily
 > exploitable vulnerability allows low privileged attacker with network access
 > via multiple protocols to compromise MySQL Server. Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or frequently
 > repeatable crash (complete DOS) of MySQL Server.

 > CVE-2017-10268 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Replication). Supported versions that are affected are
 > 5.5.57 and earlier, 5.6.37 and earlier and 5.7.19 and earlier. Difficult to
 > exploit vulnerability allows high privileged attacker with logon to the
 > infrastructure where MySQL Server executes to compromise MySQL Server.
 > Successful attacks of this vulnerability can result in unauthorized access to
 > critical data or complete access to all MySQL Server accessible data.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
