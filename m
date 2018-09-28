From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:37:33 +0200
Subject: [Buildroot] [PATCH] imagemagick: security bump to version
 7.0.7-39
In-Reply-To: <20180902083321.29329-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 2 Sep 2018 10:33:21 +0200")
References: <20180902083321.29329-1-peter@korsgaard.com>
Message-ID: <87efdd94s2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes:
 > 2018-06-06  7.0.7-39  <quetzlzacatenango@image...>
 >   * Fixed numerous use of uninitialized values, integer overflow, memory
 >     exceeded, and timeouts (credit to OSS Fuzz).

 > The most critical of these are:
 > https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=8772
 > https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=8782

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
