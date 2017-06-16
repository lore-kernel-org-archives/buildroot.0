From: Dmitrii Kolesnichenko <Dmitrii.Kolesnichenko@synopsys.com>
Date: Fri, 16 Jun 2017 11:51:49 +0000
Subject: [Buildroot] [PATCH] libtirpc: Fix build error due to missing
 stdint.h inclusion
In-Reply-To: <20170615231920.5816dc03@windsurf.lan>
References: <20170615180517.17185-1-dmitrii@synopsys.com>
 <20170615231920.5816dc03@windsurf.lan>
Message-ID: <0ED1FB7E7CA752468B2E7F31EDFC6CD6013BA8A2@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Thanks for the contribution. However, could you be more specific about which Buildroot configuration triggers this build failure?

It occurs when I build rootfs for ARC glibc toolchain. When I build uClibc toolchain this failure doesn't occur.

Thanks,

Dmitrii Kolesnichenko
