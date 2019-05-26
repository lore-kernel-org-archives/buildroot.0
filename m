From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:22:15 +0200
Subject: [Buildroot] [PATCH] package/samba4: security bump to version
 4.9.8
In-Reply-To: <20190514114205.10515-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 14 May 2019 13:42:05 +0200")
References: <20190514114205.10515-1-peter@korsgaard.com>
Message-ID: <87muj9lge0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16860: The checksum validation in the S4U2Self handler in the
 > embedded Heimdal KDC did not first confirm that the checksum was keyed,
 > allowing replacement of the requested target (client) principal.

 > For more details, see the advisory:
 > https://www.samba.org/samba/security/CVE-2018-16860.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
