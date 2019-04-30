From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 13:19:48 +0200
Subject: [Buildroot] [PATCH] package/strace: disable build for nds32
In-Reply-To: <dbfab28381ec6dcae5fd92f7e6f2e0b56cf68d8e.1556621604.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 30 Apr 2019 13:53:24 +0300")
References: <dbfab28381ec6dcae5fd92f7e6f2e0b56cf68d8e.1556621604.git.baruch@tkos.co.il>
Message-ID: <87wojbn3jf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Current version of strace does not support nds32.
 > Fixes:
 > http://autobuild.buildroot.net/results/05ec776548c9bede4878d4c3c43040c5b0aac182
 > http://autobuild.buildroot.net/results/24023f2fa3dbf7c281726abdbfd4322badaffbfb

 > Cc: Nylon Chen <nylon7@andestech.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
