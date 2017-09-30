From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Sep 2017 08:53:32 +0200
Subject: [Buildroot] [PATCH 1/2] zsh: disable NIS support
In-Reply-To: <33b2c8f26ae3bc1de8e83512a9074beddc9cc764.1506631433.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 28 Sep 2017 23:43:52 +0300")
References: <33b2c8f26ae3bc1de8e83512a9074beddc9cc764.1506631433.git.baruch@tkos.co.il>
Message-ID: <87wp4gfzir.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The configure test for NIS and NIS+ looks for the ypcat and nisls host
 > utilities, respectively. This is not compatible with cross compile.
 > Disable both unconditionally.

 > Fixes:
 > http://autobuild.buildroot.net/results/54c/54c9c5dff3df0a43573b03896cb0629fcae08478/
 > http://autobuild.buildroot.net/results/c8e/c8e30a1eb6e77ae76292b6a01bede5abb2b1b7b7/

 > Cc: Phil Eichinger <phil.eichinger@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
