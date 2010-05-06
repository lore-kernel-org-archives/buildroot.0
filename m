From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 May 2010 20:32:20 +0200
Subject: [Buildroot] Commit "Remove BR2_GNU_TARGET_SUFFIX and compute
 GNU_TARGET_NAME"
In-Reply-To: <l2j32a6c48b1005060956vd07c3636u1e6105bcc2b5466c@mail.gmail.com>
References: <i2h32a6c48b1005060824nb4df8741p655241e4ce1b0f7e@mail.gmail.com>
	<20100506180631.3333594c@surf>
	<l2j32a6c48b1005060956vd07c3636u1e6105bcc2b5466c@mail.gmail.com>
Message-ID: <20100506203220.60d591d6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 6 May 2010 17:56:38 +0100
Quotient Remainder <quotientvremainder@gmail.com> wrote:

> The problem occurs at the configure stage of gdb (target):
> 
> checking build system type... i686-pc-linux-gnu
> checking host system type... Invalid configuration
> `arm-unknown-linux-glibcgnueabi': machine `arm-unknown-linux' not recognized

Ok, reproduced. Fix implemented and being tested, should be sent to the
list soon. Thanks for letting us now about the issue!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
