From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:30:03 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain/helpers.mk: fixup
 check_gcc_version.
In-Reply-To: <1487685891-29747-1-git-send-email-ren_guo@c-sky.com>
References: <1487685891-29747-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170309213003.25a3b356@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 22:04:51 +0800, Guo Ren wrote:
> some gcc --version ouput like this:
> $ csky-linux-gcc --version
> csky-linux-gcc (C-SKY Tools V2.8.08(Beta1)(Glibc,Linux 4.8.4), ABIV1,
> B20161118) 4.5.1
> 
> current script just find first ')', but we need find last ')' to get
> correct version number.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>

A different, and much simpler fix was committed in
https://git.buildroot.org/buildroot/commit/?id=06cd604ec6d34f25b436ab729543418042a87e1c.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
