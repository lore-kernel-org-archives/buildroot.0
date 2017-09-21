From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 23:25:21 +0200
Subject: [Buildroot] [PATCH-2017.02.x] package/samba4: security bump to
	version 4.5.14
In-Reply-To: <20170921154208.19079-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 21 Sep 2017 17:42:08 +0200")
References: <20170921154208.19079-1-peter@korsgaard.com>
Message-ID: <87r2uzsq0u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Release notes:
 > https://www.samba.org/samba/history/samba-4.5.14.html

 > Fixes
 > - CVE-2017-12150 (SMB1/2/3 connections may not require signing where
 >   they should)
 > - CVE-2017-12151 (SMB3 connections don't keep encryption across DFS
 >   redirects)
 > - CVE-2017-12163 (Server memory information leak over SMB1)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
