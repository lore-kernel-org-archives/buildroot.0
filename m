From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Jan 2018 22:51:37 +0100
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump version to
 10.1.30
In-Reply-To: <20180105144726.3756-1-bluemrp9@gmail.com> (Ryan Coe's message of
 "Fri, 5 Jan 2018 06:47:26 -0800")
References: <20180105144726.3756-1-bluemrp9@gmail.com>
Message-ID: <87zi5onhna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Release notes: https://mariadb.com/kb/en/mariadb-10130-release-notes/
 > Changelog: https://mariadb.com/kb/en/mariadb-10130-changelog/

 > Fixes the following security vulnerability:

 > CVE-2017-15365 - Replication in sql/event_data_objects.cc occurs before ACL
 > checks.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
