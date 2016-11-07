From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:06:22 +0100
Subject: [Buildroot] [PATCH] assimp: disable package with the ADI
 Blackfin toolchain
In-Reply-To: <1478363533-29295-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478363533-29295-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161107230622.5c3554d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 17:32:13 +0100, Thomas Petazzoni wrote:
> assimp fails to build with an internal compiler error with the ADI
> Blackfin toolchain, while it builds fine with the mainline gcc for
> Blackfin. So let's disable this package (which has no reverse
> dependencies that select it) for the ADI Blackfin toolchain.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/394e3545a7bbe5d6fbaf4c97f0a3eb51c7d57076
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/assimp/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
