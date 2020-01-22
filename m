From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 20:51:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.11.5
In-Reply-To: <20200122185659.336443-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 22 Jan 2020 19:56:59 +0100")
References: <20200122185659.336443-1-bernd.kuhls@t-online.de>
Message-ID: <87h80nxob8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes: https://www.samba.org/samba/history/samba-4.11.5.html
 > This is a security release in order to address the following defects:

 > CVE-2019-14902: Replication of ACLs set to inherit down a subtree on AD
 >                 Directory not automatic.
 > CVE-2019-14907: Crash after failed character conversion at log level 3
 >                 or above.
 > CVE-2019-19344: Use after free during DNS zone scavenging in Samba AD
 >                 DC.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
