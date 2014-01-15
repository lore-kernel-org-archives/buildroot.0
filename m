From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 20:29:01 +0100
Subject: [Buildroot] [PATCH] busybox: udhcpc script: create resolv.conf
In-Reply-To: <2c4d5dc2aabdcbea6f0b2395f90f30dd4d2a3710.1389812698.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 15 Jan 2014 21:04:58 +0200")
References: <2c4d5dc2aabdcbea6f0b2395f90f30dd4d2a3710.1389812698.git.baruch@tkos.co.il>
Message-ID: <87txd5t56q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Eliminate the following error message on every boot:
 > grep: /etc/resolv.conf: No such file or directory

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
