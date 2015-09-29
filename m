From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:35:26 +0200
Subject: [Buildroot] [PATCH 1/2] postgresql: disable rpath
In-Reply-To: <b782d1949e86cb4f2479ffac8fc47dffda0d1b9f.1443556892.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 Sep 2015 23:01:31 +0300")
References: <b782d1949e86cb4f2479ffac8fc47dffda0d1b9f.1443556892.git.baruch@tkos.co.il>
Message-ID: <87oagkyhu9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The linker -rpath option causes the linker to search for libraries in host
 > directories.

 > Should fix:
 > http://autobuild.buildroot.net/results/2cc/2cca5f8d8a8cd1bf9bbbc8c955aec477839e059f/
 > http://autobuild.buildroot.net/results/da6/da61d30791f216033971d679c84704d0fc0c3de0/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
