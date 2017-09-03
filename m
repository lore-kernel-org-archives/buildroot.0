From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 16:04:09 +0200
Subject: [Buildroot] [PATCH 7/9] arch/arm: add some non-cortex armv8a
	cores
In-Reply-To: <3447db07fd4678fa60261dd0e400218072d33482.1504444617.git.yann.morin.1998@free.fr>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
 <3447db07fd4678fa60261dd0e400218072d33482.1504444617.git.yann.morin.1998@free.fr>
Message-ID: <20170903160409.57196eed@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Sep 2017 15:17:47 +0200, Yann E. MORIN wrote:
> Some need gcc-5, some gcc-6 and some gcc-7.
> 
> The thunderx familly does not build in 32-bit mode (gcc complains
> that the CPU is unknown, and even gcc master only knows them as
> aarch64-only).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arm | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)

Series looks good, but on this one, I'm wondering: do we really want to
add this long list of CPU cores, that most likely nobody is ever going
to use with Buildroot ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
