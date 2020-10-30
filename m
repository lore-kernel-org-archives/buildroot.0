From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 30 Oct 2020 08:48:17 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH_2/3=5D_package/libabseil-cpp=3A_d?=
 =?utf-8?q?epend_on_gcc_=3E=3D_4=2E9?=
In-Reply-To: <20201029233638.78c58b98@windsurf.home>
Message-ID: <52-5f9bc580-1-71e23380@170443290>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thursday, October 29, 2020 23:36 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote: 

> 
> Is this fixing a build issue ? If so, is this issue reported in the
> autobuilders ? If it's not fixing a build issue, what is the
> reason/intention behind this change ?
> 

The build with 4.8 still fails after applying the first patch of this series. As this is shadowed by the C++11 error it doesn't turn up in the autobuilders.
Should I just include a build error output into the commit?

Regards,
Michael
