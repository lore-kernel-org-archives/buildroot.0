From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:29:53 +0200
Subject: [Buildroot] [PATCH 4/4 v3] package/kvm-unit-test: available for
 big.LITTLE arm cores too
In-Reply-To: <e9a53f9e66ea0d124e8c4ab028f01b41d694910d.1499592591.git.yann.morin.1998@free.fr>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <e9a53f9e66ea0d124e8c4ab028f01b41d694910d.1499592591.git.yann.morin.1998@free.fr>
Message-ID: <20170722232953.40f3d5ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Jul 2017 11:30:01 +0200, Yann E. MORIN wrote:
> Since it supports each variants individually, it should also supports
> the big.LITTLE configurations.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Cyril Bur <cyrilbur@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/kvm-unit-tests/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
