From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:44:30 +0200
Subject: [Buildroot] [PATCH 1/2] utils/test-pkg: add option to use an
 alternate toolchains CSV file
In-Reply-To: <20170725213613.6714-1-arnout@mind.be>
References: <20170725213613.6714-1-arnout@mind.be>
Message-ID: <20170729154430.06ce2118@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Jul 2017 23:36:12 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> When testing a package with test-pkg, it may be useful to override the
> set of toolchains used. For example:
> - to test with toolchains used in your company;
> - to test agains a subset that is known to be problematic;
> - to use only toolchains you already have available locally when you
>   have no network access.
> 
> Add an option to use an alternate CSV file containing the config
> fragments of toolchains to try.
> 
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v8: reformulate commit message
> v7: CSV file instead of directory
> v6: s/defconfig/config fragment/g
> v5: First version

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
