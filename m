From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 May 2015 23:22:34 +0200
Subject: [Buildroot] [PATCH] iproute2: disable xtables on static build
In-Reply-To: <fa972eff514e12b82ce7d6c557950f6e63b57724.1432188465.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 21 May 2015 09:07:45 +0300")
References: <fa972eff514e12b82ce7d6c557950f6e63b57724.1432188465.git.baruch@tkos.co.il>
Message-ID: <87r3q939t1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > iproute2 always builds m_xt.so as a shared library.
 > Fixes:
 > http://autobuild.buildroot.net/results/f42/f42bbbf5be4594a8806d0e571586ce2bf119582d/
 > http://autobuild.buildroot.net/results/3b3/3b37871bdf5766677fc20dca22c13177091d104f/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
