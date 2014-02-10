From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 18:44:23 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-07
In-Reply-To: <20140210173137.GA5239@free.fr>
References: <20140208073009.5C3E6100CDC@stock.ovh.net>
 <20140208124907.GA3442@free.fr> <20140210093158.1dc26780@skate>
 <20140210173137.GA5239@free.fr>
Message-ID: <20140210184423.5595106e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 10 Feb 2014 18:31:37 +0100, Yann E. MORIN wrote:

> Something like:
> 
>     config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
>         bool
> 
>     config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> 
>     config BR2_PACKAGE_DVB_APPS
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> 
> And so on for all the headers version of interest?

Yes, exactly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
