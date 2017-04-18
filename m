From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Apr 2017 17:39:10 +0200
Subject: [Buildroot] [PATCH v6 1/9] support/test-pkg: calculate
 toolchain name only once
In-Reply-To: <20170407111624.4629-2-arnout@mind.be>
References: <20170407111624.4629-1-arnout@mind.be>
 <20170407111624.4629-2-arnout@mind.be>
Message-ID: <20170418173910.087efd80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Apr 2017 13:16:16 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The toolchain name was calculated in main() for reporting to the user,
> and again in build_one() for creating the build directory. Calculate
> it only once, in main(), and pass the build directory as an argument
> to build_one().
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changed v5 -> v6 by Arnout:
>   - Don't move mkdir up to main().

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
