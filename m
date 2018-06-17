From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:55:22 +0200
Subject: [Buildroot] [PATCH 2/4] quota: depend on host-nfs-utils
In-Reply-To: <019d713946a4d86bc6cceede37e82e6994e34978.1526643119.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 18 May 2018 14:31:57 +0300")
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 <019d713946a4d86bc6cceede37e82e6994e34978.1526643119.git.baruch@tkos.co.il>
Message-ID: <87602hv4x1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > host-nfs-utils provides the host rpcgen utility. This fixes the build on
 > recent Fedora systems that removed rpcgen from the glibc package.

 > Fixes:
 > http://autobuild.buildroot.net/results/730/730acb23663ebbbaba847073979654670a8bc64c/
 > http://autobuild.buildroot.net/results/e49/e49932e9d958203d585cdddd795df06aad6ff3a9/
 > http://autobuild.buildroot.net/results/1b7/1b7dccf7b9742d1b9cb57bffe55eac5cfc66b15c/

 > Cc: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
