From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2020 12:25:44 +0200
Subject: [Buildroot] [PATCH] package/trousers: add upstream security fix
In-Reply-To: <20200824095822.6505-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 24 Aug 2020 11:58:22 +0200")
References: <20200824095822.6505-1-peter@korsgaard.com>
Message-ID: <87k0xoxrvb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2020-24332
 > If the tcsd daemon is started with root privileges,
 > the creation of the system.data file is prone to symlink attacks

 > CVE-2020-24330
 > If the tcsd daemon is started with root privileges,
 > it fails to drop the root gid after it is no longer needed

 > CVE-2020-24331
 > If the tcsd daemon is started with root privileges,
 > the tss user has read and write access to the /etc/tcsd.conf file

 > For details, see the advisory:
 > https://www.openwall.com/lists/oss-security/2020/05/20/3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ups, forgot the _IGNORE_CVES entry. I'll send a v2.

-- 
Bye, Peter Korsgaard
