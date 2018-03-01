From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 23:20:49 +0100
Subject: [Buildroot] [PATCH next] 18xx-ti-utils: new package
In-Reply-To: <d322743a2a05c94eb5e1403f726b2c55372df556.1519941102.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 1 Mar 2018 23:51:42 +0200")
References: <d322743a2a05c94eb5e1403f726b2c55372df556.1519941102.git.baruch@tkos.co.il>
Message-ID: <87fu5jfnem.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > These are spacial RF calibration utilities for TI Wilink 18xx
 > modules.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v3:
 >   * Propagate dependencies (Marcus)
 >   * Add license information and hash
 > +	help
 > +	  TI Wilink calibration utilities.
 > +
 > +	  CONFIG_NL80211_TESTMODE must be enabled in the kernel
 > +	  configuration for this package to work.

Would it make sense to force this option on in linux.mk like we do for
other packages?

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
