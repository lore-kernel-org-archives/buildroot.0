From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2016 15:52:26 +0100
Subject: [Buildroot] [PATCH 1/3] package/gdb: add support for gdb 7.12
In-Reply-To: <1481726889.3994.6.camel@embedded.rocks>
References: <20161214134058.29826-1-joerg.krause@embedded.rocks>
 <20161214152028.4b2caf8f@free-electrons.com>
 <1481726889.3994.6.camel@embedded.rocks>
Message-ID: <20161214155226.0dc7204e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Dec 2016 15:48:09 +0100, J?rg Krause wrote:

> The issue address by the patch 'Revert "sim: unify SIM_CPU definition"'
> should be fixed by this commit [1].

Indeed, seems related.

> I double checked by building gdb 7.12?without the mentioned patch for
> the target bf512 with this [2] Buildroot toolchain configuration
> successfully.

OK. Note that just building gdb was not sufficient to trigger the
problem, you had to enable the GDB simulator (in host gdb), if I
remember correctly.

But that's fine, the patch you point at is clearly addressing the
original problem, so we're good.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
