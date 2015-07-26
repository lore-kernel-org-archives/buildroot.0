From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:25:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: boost needs wchar
In-Reply-To: <1437725693-21075-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437725693-21075-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150726152523.3de110db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 24 Jul 2015 10:14:53 +0200, J?rg Krause wrote:
> The most modules of boost needs a toolchain with wchar. To ease maintenance
> we make the entire boost package depend on wchar.
> 
> Also add a reverse dependency to libftdipp1 and yaml-cpp.
> 
> Fixes:
> http://autobuild.buildroot.net/results/49f/49f5c0521fc90fbd4673ad233ff679be007d2953/
> http://autobuild.buildroot.net/results/12f/12f544c97e3451fb2a72025ebc62292957e47070/
> http://autobuild.buildroot.net/results/ef6/ef6c897ea7547e8ed5f019e8ce4473f0998f2c16/
> http://autobuild.buildroot.net/results/7a0/7a0ab069c505696a7887ba5c561b76b233ce59d5/
> 
> and more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/boost/Config.in    | 13 +++----------
>  package/libftdi1/Config.in |  5 +++--
>  package/yaml-cpp/Config.in |  5 +++--
>  3 files changed, 9 insertions(+), 14 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
