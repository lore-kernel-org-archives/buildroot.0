From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:51:39 +0200
Subject: [Buildroot] [PATCH] mariadb: security bump version to 10.1.33
In-Reply-To: <20180608164434.18857-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 8 Jun 2018 18:44:34 +0200")
References: <20180608164434.18857-1-peter@korsgaard.com>
Message-ID: <87o9g9pg1g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Release notes: https://mariadb.com/kb/en/mariadb-10133-release-notes/
 > Changelog: https://mariadb.com/kb/en/mariadb-10133-changelog/

 > Fixes the following security vulnerabilities:

 > CVE-2018-2782 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB).  Supported versions that are affected are 5.6.39 and
 > prior and 5.7.21 and prior.  Easily exploitable vulnerability allows low
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server.  Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > CVE-2018-2784 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB).  Supported versions that are affected are 5.6.39 and
 > prior and 5.7.21 and prior.  Easily exploitable vulnerability allows low
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server.  Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > CVE-2018-2787 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB).  Supported versions that are affected are 5.6.39 and
 > prior and 5.7.21 and prior.  Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server.  Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server as well as unauthorized update, insert or
 > delete access to some of MySQL Server accessible data.

 > CVE-2018-2766 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB).  Supported versions that are affected are 5.6.39 and
 > prior and 5.7.21 and prior.  Easily exploitable vulnerability allows high
 > privileged attacker with network access via multiple protocols to compromise
 > MySQL Server.  Successful attacks of this vulnerability can result in
 > unauthorized ability to cause a hang or frequently repeatable crash
 > (complete DOS) of MySQL Server.

 > CVE-2018-2755 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Replication).  Supported versions that are affected
 > are 5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Difficult to
 > exploit vulnerability allows unauthenticated attacker with logon to the
 > infrastructure where MySQL Server executes to compromise MySQL Server.
 > Successful attacks require human interaction from a person other than the
 > attacker and while the vulnerability is in MySQL Server, attacks may
 > significantly impact additional products.  Successful attacks of this
 > vulnerability can result in takeover of MySQL Server.

 > CVE-2018-2819 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB).  Supported versions that are affected are 5.5.59 and
 > prior, 5.6.39 and prior and 5.7.21 and prior.  Easily exploitable
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server.  Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2018-2817 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DDL).  Supported versions that are affected are
 > 5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Easily exploitable
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server.  Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2018-2761 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Client programs).  Supported versions that are affected are
 > 5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Difficult to
 > exploit vulnerability allows unauthenticated attacker with network access
 > via multiple protocols to compromise MySQL Server.  Successful attacks of
 > this vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2018-2781 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Optimizer).  Supported versions that are affected are
 > 5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Easily exploitable
 > vulnerability allows high privileged attacker with network access via
 > multiple protocols to compromise MySQL Server.  Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2018-2771 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Locking).  Supported versions that are affected are
 > 5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Difficult to
 > exploit vulnerability allows high privileged attacker with network access
 > via multiple protocols to compromise MySQL Server.  Successful attacks of
 > this vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2018-2813 - Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: DDL).  Supported versions that are affected are
 > 5.5.59 and prior, 5.6.39 and prior and 5.7.21 and prior.  Easily exploitable
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server.  Successful attacks of this
 > vulnerability can result in unauthorized read access to a subset of MySQL
 > Server accessible data.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
