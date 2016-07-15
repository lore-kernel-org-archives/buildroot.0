From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 16:42:19 +0200
Subject: [Buildroot] [PATCH] package/upmpdcli: needs MMU
In-Reply-To: <1468075339-29551-1-git-send-email-yann.morin.1998@free.fr>
References: <1468075339-29551-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160715164219.45383d74@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jul 2016 16:42:19 +0200, Yann E. MORIN wrote:
> ... because it uses fork().
> 
> Fixes:
>     http://autobuild.buildroot.org/results/9ae/9ae5c773e62bbe84f2d0495f074d659fa3dcd55b/
>     http://autobuild.buildroot.org/results/8af/8afb9f96bb827b723b859ff73cdf674ca6434e7c/
>     http://autobuild.buildroot.org/results/abe/abe9be3b78f26f56035ec805a86ab33b1d145a02/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/upmpdcli/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I've applied, after propagating the BR2_USE_MMU dependency to the
Config.in comment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
