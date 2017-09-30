From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Sep 2017 09:00:10 +0200
Subject: [Buildroot] [PATCH 2/2] zsh: bump to version 5.4.2
In-Reply-To: <9493704a4250d204236f37eebc1b07162ed0f80a.1506631433.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 28 Sep 2017 23:43:53 +0300")
References: <33b2c8f26ae3bc1de8e83512a9074beddc9cc764.1506631433.git.baruch@tkos.co.il>
 <9493704a4250d204236f37eebc1b07162ed0f80a.1506631433.git.baruch@tkos.co.il>
Message-ID: <87shf4fz7p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Upstream does not provide a .tar.xz archive for this release. Revert to
 > .tar.gz.

 > Cc: Phil Eichinger <phil.eichinger@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

It would be good to also add a hash for the license file whenever we
bump the version. I've now pushed a patch adding one for zsh.

-- 
Bye, Peter Korsgaard
