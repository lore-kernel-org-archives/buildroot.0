From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:56:46 +0100
Subject: [Buildroot] [PATCH 5/8] packages: remove "consecutive empty
 lines"
In-Reply-To: <65d3b7e00fb26f0f0228431f055e19227dfa55b1.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <65d3b7e00fb26f0f0228431f055e19227dfa55b1.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171201225646.0b50e5aa@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:42 +0100, Yann E. MORIN wrote:
> ... as reported by utils/check-package
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Yegor Yefremov<yegorslists@googlemail.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python3/python3.mk | 2 --
>  package/setools/setools.mk | 1 -
>  2 files changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
