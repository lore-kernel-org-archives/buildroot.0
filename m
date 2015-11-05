From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 23:25:08 +0100
Subject: [Buildroot] [PATCH v2] toolchain/external:: Fix gdbserver
 install with linaro 2015.08
In-Reply-To: <1446754352.4553.10.camel@rtred1test09.kymeta.local>
References: <1446752721.4553.8.camel@rtred1test09.kymeta.local>
 <20151105195529.GC3781@free.fr>
 <1446754352.4553.10.camel@rtred1test09.kymeta.local>
Message-ID: <20151105232508.45ec5c4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Trent Piepho,

On Thu, 5 Nov 2015 20:12:32 +0000, Trent Piepho wrote:
> It's now in bin/gdbserver from the install dir of the toolchain.
> 
> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied after tweaking the commit title and commit log, in part using
the suggestion from Yann E. Morin.

See:

   http://git.buildroot.net/buildroot/commit/?id=d7a92aa2fbe1cfd13c8d0bf7c7942b2ead747ffe

for the final commit.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
