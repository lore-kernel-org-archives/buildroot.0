From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 20:42:57 +0200
Subject: [Buildroot] [PATCH] libidn: fix build without makeinfo
In-Reply-To: <583676ae200bd379b846d5ccdcc5a2aafa4aad18.1506196074.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 23 Sep 2017 22:47:54 +0300")
References: <583676ae200bd379b846d5ccdcc5a2aafa4aad18.1506196074.git.baruch@tkos.co.il>
Message-ID: <87ing8kkem.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Build fails when the makeinfo utility is not installed on the host.
 > Fixes:
 > http://autobuild.buildroot.net/results/dfd/dfdfb34ed81ba3a4b7a7271be482e75eca849dbf/
 > http://autobuild.buildroot.net/results/b33/b33c0b0e6b1033ab1d1294a91b869ee6adcd391a/
 > http://autobuild.buildroot.net/results/940/9401cc10f6da6a2e3453ebc65ce573c370733fb5/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
