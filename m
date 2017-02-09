From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:13:17 +0100
Subject: [Buildroot] [PATCH 4/6] supprt/test-pkg: add option to limit
 the number of tests
In-Reply-To: <8692415de7ac5443fc33de24af13db639ad0ce74.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <8692415de7ac5443fc33de24af13db639ad0ce74.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <20170209231317.1c9be275@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Feb 2017 21:15:27 +0100, Yann E. MORIN wrote:
> Sometimes, it interesting to have a global overview of whether the
> package builds at all or not, rather than test on all toolchains.
> 
> Add an option that allows testing on a limited set of randomly choosen
> toolchains.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> 
> ---
> Changes v1 -> v2;
>   - fix when option is not provided
> ---
>  support/scripts/test-pkg | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
