From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Aug 2018 21:14:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump to
 version 4.8.4
In-Reply-To: <20180815052300.11971-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 15 Aug 2018 07:23:00 +0200")
References: <20180815052300.11971-1-bernd.kuhls@t-online.de>
Message-ID: <871sazbfx6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes: https://www.samba.org/samba/history/samba-4.8.4.html
 > Fixes

 > o  CVE-2018-1139  (Weak authentication protocol allowed.)
 > o  CVE-2018-1140  (Denial of Service Attack on DNS and LDAP server.)
 > o  CVE-2018-10858 (Insufficient input validation on client directory
 >                    listing in libsmbclient.)
 > o  CVE-2018-10918 (Denial of Service Attack on AD DC DRSUAPI server.)
 > o  CVE-2018-10919 (Confidential attribute disclosure from the AD LDAP
 >                    server.)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
