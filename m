From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 14:00:22 +0100
Subject: [Buildroot] [PATCH 1/2] tstools: disable parallel build
In-Reply-To: <74fc8a8ac83ac7ebd5d81694df6b95700eeef939.1416230020.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 17 Nov 2014 15:13:39 +0200")
References: <74fc8a8ac83ac7ebd5d81694df6b95700eeef939.1416230020.git.baruch@tkos.co.il>
Message-ID: <87bno4r7dl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 0e8cbd5902e4 (tstools: fix build failure in parallel (-j) build) didn't
 > fix, apparently, the parallel build issue. Revert this commit, and just
 > disable parallel build.

 > Fixes:
 > http://autobuild.buildroot.net/results/b13/b13d31a8a915a740386befb018f859d3df5e9c35/
 > http://autobuild.buildroot.net/results/287/287249ce9d337d4efc587f833f811851cafc607a/
 > http://autobuild.buildroot.net/results/e4e/e4ee0ae40ac9d58b3182db52d5a39e6ac3692f60/

 > Cc: Tzu-Jung Lee <roylee17@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
