From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Mar 2018 08:43:31 +0100
Subject: [Buildroot] [PATCH] ntp: fix build without SSP support
In-Reply-To: <ab4e9cb9b31bd917e77118e2f619562556df70e5.1520405981.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 7 Mar 2018 08:59:41 +0200")
References: <ab4e9cb9b31bd917e77118e2f619562556df70e5.1520405981.git.baruch@tkos.co.il>
Message-ID: <87d10gpbz0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > In version 4.2.8p11 ntp changed its configure script build hardening
 > parameter to '--with-hardenfile'. Update the parameter name to avoid
 > -fstack-protector-all when the toolchain does not support this option.

 > Fixes:
 > http://autobuild.buildroot.net/results/60e/60e8b9864932f2cabc7deb43234abe168bd113c5/
 > http://autobuild.buildroot.net/results/592/592db6836817bb078a2f1146d2ce6241bf7997a3/
 > http://autobuild.buildroot.net/results/b07/b070fbc66a928888df8d2561dad3632778d55e0d/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
