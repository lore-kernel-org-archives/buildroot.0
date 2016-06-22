From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 17:01:49 +0200
Subject: [Buildroot] [PATCH v2] strace: fix build with kernel headers
	before v3.11
In-Reply-To: <f3bfffca7c2157951b83a683b00d3becc0405a97.1466606550.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 22 Jun 2016 17:42:30 +0300")
References: <f3bfffca7c2157951b83a683b00d3becc0405a97.1466606550.git.baruch@tkos.co.il>
Message-ID: <87eg7pw9lu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch with fixes for missing btrfs ioctl macros.
 > Fixes:
 > http://autobuild.buildroot.net/results/fd6/fd6e8b6386c3d3170168608c49a0efde7b7fa269/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: remove unrelated binary image

Committed, thanks.

-- 
Bye, Peter Korsgaard
