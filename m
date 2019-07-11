From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 11 Jul 2019 08:04:06 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH v2] toolchain: fix ARC GCC
 internal compiller error
In-Reply-To: <20190702095238.7079-1-Evgeniy.Didin@synopsys.com>
References: <20190702095238.7079-1-Evgeniy.Didin@synopsys.com>
Message-ID: <CY4PR1201MB0120A72B446B7F4EF349A8FBA1F30@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

> -----Original Message-----
> From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Sent: Tuesday, July 2, 2019 10:53 AM
> To: buildroot at busybox.net
> Cc: Evgeniy Didin <didin@synopsys.com>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>; arc-
> buildroot at synopsys.com
> Subject: [arc-buildroot] [PATCH v2] toolchain: fix ARC GCC internal compiller error
> 
> With recent arc-toolchain update some packages started to fail with
> internal compiler error. This error first was catched while building
> glibc-testsuite with upstream gcc-8 and ARC port of glibc. For
> more information see BUG 89838:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89838
> 
> This commit temporarily adds patch for current version of arc-gcc and
> should be removed with update to next version of ARC tools.
> 
> Fix in upstream gcc:
> https://gcc.gnu.org/viewcvs/gcc?view=revision&sortby=date&revision=272645
> 
> Fixes:
> http://autobuild.buildroot.net/results/66e/66e8f28ed171b5c8994e6ba8c4e6257d6bbe0191//
> http://autobuild.buildroot.net/results/789/789016ff66bb4bcd2667a8c5241a680b98db5b2f//
> http://autobuild.buildroot.net/results/dd9/dd9de722b886dee3e6373b026062e1aecc11efd3//

Does that respin looks good?
Would be nice to apply the fix so quite some build breakages go away.

-Alexey
