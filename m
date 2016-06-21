From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jun 2016 16:41:58 +0200
Subject: [Buildroot] [PATCH] fwup: disable documentation build
In-Reply-To: <dcd45c085506be96cfcec71a7357ddeba84c2df3.1466511361.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 21 Jun 2016 15:16:01 +0300")
References: <dcd45c085506be96cfcec71a7357ddeba84c2df3.1466511361.git.baruch@tkos.co.il>
Message-ID: <87y45yy56x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Documentation build with help2man relies on the output of running 'fwup
 > --help'. That obviously can't work with cross compilation.

 > Fixes:
 > http://autobuild.buildroot.net/results/bdd/bdd8137973c37824f6aa9261ee307f6ed21b9166/
 > http://autobuild.buildroot.net/results/96a/96a53b3ec666bd09f09c8a3e5b31eff73e3dd0fa/
 > http://autobuild.buildroot.net/results/e0b/e0bcfaf9dd36d4992e507d18afeb1cec56048987/

 > Cc: Frank Hunleth <fhunleth@troodon-software.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
