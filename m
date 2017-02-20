From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:50:31 +0100
Subject: [Buildroot] [PATCH 1/2] package/sunxi-mali: reorder
 select/depends
In-Reply-To: <20170218145258.10213-1-romain.naour@gmail.com>
References: <20170218145258.10213-1-romain.naour@gmail.com>
Message-ID: <20170220225031.0d382b73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 15:52:57 +0100, Romain Naour wrote:
> From [1]:
> "Even though the ordering has absolutely no consequences in Kconfig, it
> is not logical (when reading). It is more logical and far easier to
> understand when depends come first, followed by the selects."
> 
> Also, the Config.in example in the manual suggests to use this coding
> style [2].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
> [2] https://buildroot.org/downloads/manual/manual.html#writing-rules-config-in
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/sunxi-mali/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
