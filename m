From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:55:50 +0200
Subject: [Buildroot] [PATCH 3/4] samba4: depend on host-nfs-utils
In-Reply-To: <be167a061f05c8d86828d2b6f556fa6ed29ce54e.1526643119.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 18 May 2018 14:31:58 +0300")
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 <be167a061f05c8d86828d2b6f556fa6ed29ce54e.1526643119.git.baruch@tkos.co.il>
Message-ID: <87wouxtqbt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > host-nfs-utils provides the host rpcgen utility. This fixes the build on
 > recent Fedora systems that removed rpcgen from the glibc package.

 > Fixes:
 > http://autobuild.buildroot.net/results/6f8/6f869b8c7c182dfe7f1a291b5952320504540ebf/
 > http://autobuild.buildroot.net/results/4c2/4c228dd6369e4fc11b798af6ab2abe06d7473b78/
 > http://autobuild.buildroot.net/results/489/489be441abd19fba2b0c39357e64a6adcf773b60/

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
