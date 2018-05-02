From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 May 2018 21:32:50 +0200
Subject: [Buildroot] [PATCH] python-subprocess32: needs kernel headers
 v3.10 on MIPS N64
In-Reply-To: <6d664294ed5afa0b91e3cf3c32c30fac38d573f0.1525285999.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 2 May 2018 21:33:19 +0300")
References: <6d664294ed5afa0b91e3cf3c32c30fac38d573f0.1525285999.git.baruch@tkos.co.il>
Message-ID: <87bmdxetul.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > MIPS N64 ABI has been missing getdents64 wire up until kernel version
 > 3.10. Make python-subprocess32 depend on newer headers for MIPS N64.

 > Fixes:
 > http://autobuild.buildroot.net/results/af1/af1c0dbfcc27fa93992de57f986657d65163800e/
 > http://autobuild.buildroot.net/results/e5f/e5f9e96d02512359348886a9db3aa4cea9db2081/
 > http://autobuild.buildroot.net/results/8ba/8ba4c75d724b45c4fe10b4b6c90602b68a811fac/

 > Cc: Asaf Kahlon <asafka7@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
