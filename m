From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 13:38:00 +0100
Subject: [Buildroot] [PATCH] mariadb: security bump to version 10.1.22
In-Reply-To: <20170315104832.6755-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 15 Mar 2017 11:48:32 +0100")
References: <20170315104832.6755-1-peter@korsgaard.com>
Message-ID: <87bmt2sok7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > CVE-2017-3302 - C client library for MySQL (libmysqlclient.so) has
 > use-after-free defect which can cause crash of applications using that MySQL
 > client.

 > CVE-2017-3313 - Difficult to exploit vulnerability allows low privileged
 > attacker with logon to the infrastructure where MySQL Server executes to
 > compromise MySQL Server.  Successful attacks of this vulnerability can
 > result in unauthorized access to critical data or complete access to all
 > MySQL Server accessible data.

 > And a number of important, but non-security related fixes:

 > MDEV-11842: Fix a 10.1.21 regression with failed INSERT, BEFORE INSERT
 > triggers, and columns with no default value

 > MDEV-12075: Fix a 10.1.21 regression in the InnoDB data file extension code

 > For details, see the release notes:
 > https://mariadb.com/kb/en/mariadb/mariadb-10122-release-notes/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
