From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:28:02 +0200
Subject: [Buildroot] [PATCH] lcdproc: fix build with musl libc
In-Reply-To: <fd90703c9a740c0f5653e4d6e43386a5194516f6.1504870274.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 8 Sep 2017 14:31:14 +0300")
References: <fd90703c9a740c0f5653e4d6e43386a5194516f6.1504870274.git.baruch@tkos.co.il>
Message-ID: <874lrxz3dp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch adding missing linux ioctl header.
 > Fixes:
 > http://autobuild.buildroot.net/results/58a/58a9b98d08060c6ed9e8855ba9f59d03aa2f3e2c/
 > http://autobuild.buildroot.net/results/5b2/5b2c1bc872cebc7aadf93995b71178bba29e0b25/
 > http://autobuild.buildroot.net/results/125/12594e613f8fc106e477411f76093654a084c01c/

 > Cc: Sven Haardiek <sven.haardiek@greenbone.net>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
