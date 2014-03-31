From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 31 Mar 2014 10:42:28 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-28
In-Reply-To: <20140331123233.256f294c@skate>
References: <20140329073011.D16F2101349@stock.ovh.net>
 <20140329175452.5c711852@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356C9AB43@de02wembxa.internal.synopsys.com>
 <20140331123233.256f294c@skate>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356C9AB75@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> 
> No, I don't think libc.a should be built with -fPIC. Just leave the ARC
> build as it is. The real problem here is that lcdproc attempts to build
> a shared library, even if the configuration says BR2_PREFER_STATIC_LIB.
> So it should be fixed either by making lcdproc not available when
> BR2_PREFER_STATIC_LIB=y, or by fixing lcdproc itself to generate a
> shared library when needed.

BTW, lcdapi package has similar issue, so I think it applies to it as well.


> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
