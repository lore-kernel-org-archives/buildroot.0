From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 09:24:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump to
	version 4.6.8
In-Reply-To: <20170920180943.7424-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 20 Sep 2017 20:09:43 +0200")
References: <20170920180943.7424-1-bernd.kuhls@t-online.de>
Message-ID: <87y3p8wm2g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://www.samba.org/samba/history/samba-4.6.8.html

 > Fixes
 > - CVE-2017-12150 (SMB1/2/3 connections may not require signing where
 >   they should)
 > - CVE-2017-12151 (SMB3 connections don't keep encryption across DFS
 >   redirects)
 > - CVE-2017-12163 (Server memory information leak over SMB1)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
