From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:15:11 +0100
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.7.6
In-Reply-To: <7e46c960480c6cbe00fab7113c6adfd7365032ff.1520962259.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 13 Mar 2018 19:30:59 +0200")
References: <7e46c960480c6cbe00fab7113c6adfd7365032ff.1520962259.git.baruch@tkos.co.il>
Message-ID: <87muzbk78g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2018-1050: Vulnerability to a denial of service attack when the RPC
 > spoolss service is configured to be run as an external daemon.

 > https://www.samba.org/samba/security/CVE-2018-1050.html

 > CVE-2018-1057: Authenticated users might change any other users'
 > passwords, including administrative users and privileged service
 > accounts (eg Domain Controllers).

 > https://www.samba.org/samba/security/CVE-2018-1057.html

 > Add clnt_create() test result to cache to fix cross configure breakage.

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
