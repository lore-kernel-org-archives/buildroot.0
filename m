From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:42:30 +0200
Subject: [Buildroot] [PATCH] stress-ng: fix build with kernel headers
 v3.9
In-Reply-To: <0f6a3acdfa31f852295e2f3be3701fdafc0f7256.1530555337.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 2 Jul 2018 21:15:37 +0300")
References: <0f6a3acdfa31f852295e2f3be3701fdafc0f7256.1530555337.git.baruch@tkos.co.il>
Message-ID: <87o9dszufd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch correcting the kernel headers version test macro.
 > Fixes:
 > http://autobuild.buildroot.net/results/cbf/cbfb80117840bddd5712bcda3caeaaff61745b0b/
 > http://autobuild.buildroot.net/results/649/64941ac5b7dcd9c100bdc47cdfe73cce5f23c3d8/
 > http://autobuild.buildroot.net/results/741/741f5881d3cb745d1003ede3f762c20eb72de0b5/

 > Cc: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
