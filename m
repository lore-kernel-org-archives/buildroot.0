From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:54:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.10.10
In-Reply-To: <20191029165627.32627-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 29 Oct 2019 17:56:27 +0100")
References: <20191029165627.32627-1-bernd.kuhls@t-online.de>
Message-ID: <87pnicvdow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > This is a security release in order to address the following defects:
 > o CVE-2019-10218: Client code can return filenames containing path
 >                   separators.
 > o CVE-2019-14833: Samba AD DC check password script does not receive
 >                   the full password.
 > o CVE-2019-14847: User with "get changes" permission can crash AD DC
 >                   LDAP server via dirsync.

 > Release notes: https://www.samba.org/samba/history/samba-4.10.10.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2019.08.x, thanks. For 2019.02.x I will instead bump to
4.9.15, which includes the same fixes.

-- 
Bye, Peter Korsgaard
