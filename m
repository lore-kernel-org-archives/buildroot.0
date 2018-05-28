From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:23:44 +0200
Subject: [Buildroot] [git commit] package/apr-util: add optional support
 for openldap
In-Reply-To: <20180508132646.8266D8B90E@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 8 May 2018 15:26:57 +0200")
References: <20180508132646.8266D8B90E@busybox.osuosl.org>
Message-ID: <87tvqryi33.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=134968c6c80fd9767e8731c821d690e53cd7f3da
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > apr-util contains optional support for openldap:

 > $ ls -1 output/target/usr/lib/apr-util-1/apr_ldap*
 > output/target/usr/lib/apr-util-1/apr_ldap-1.so
 > output/target/usr/lib/apr-util-1/apr_ldap.la
 > output/target/usr/lib/apr-util-1/apr_ldap.so

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
