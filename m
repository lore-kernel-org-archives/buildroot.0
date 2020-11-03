From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Nov 2020 08:42:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.11.15
In-Reply-To: <20201029214313.1570859-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 29 Oct 2020 22:43:13 +0100")
References: <20201029214313.1570859-1-bernd.kuhls@t-online.de>
Message-ID: <875z6mansv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > o CVE-2020-14318: Missing handle permissions check in SMB1/2/3 ChangeNotify.
 > o CVE-2020-14323: Unprivileged user can crash winbind.
 > o CVE-2020-14383: An authenticated user can crash the DCE/RPC DNS with easily
 >                   crafted records.

 > Release notes:
 > https://www.samba.org/samba/history/samba-4.11.14.html (bugfix-only)
 > https://www.samba.org/samba/history/samba-4.11.15.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
