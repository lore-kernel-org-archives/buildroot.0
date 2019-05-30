From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 23:55:25 +0200
Subject: [Buildroot] [PATCH] package/iproute2: fix build with musl libc
In-Reply-To: <11c8a42df1cd751e113215c26dc2ed701e3d716d.1559230618.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 30 May 2019 18:36:58 +0300")
References: <11c8a42df1cd751e113215c26dc2ed701e3d716d.1559230618.git.baruch@tkos.co.il>
Message-ID: <87k1e738vm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch fixing collision of definitions between libc and kernel
 > headers.

 > Fixes:
 > http://autobuild.buildroot.net/results/d38d3a84c61f37747c652382646839a69de16463/
 > http://autobuild.buildroot.net/results/41bd8e53b51a96f1b29d7ba0d8661a6dfc958415/

 > Cc: Petr Vorel <petr.vorel@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Given that these autobuilder results refer to net, committed to next -
Thanks.

-- 
Bye, Peter Korsgaard
