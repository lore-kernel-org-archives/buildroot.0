From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:30:50 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/cramfs: fix missing type
In-Reply-To: <1438807705-7170-1-git-send-email-yann.morin.1998@free.fr>
References: <1438807705-7170-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150806083050.1ffb5b8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  5 Aug 2015 22:48:25 +0200, Yann E. MORIN wrote:
> loff_t is guarded by _GNU_SOURCE. although already properly defined in
> cramfsck, it was not defined in mkcramfs.
> 
> Fixes;
>     http://autobuild.buildroot.org/results/57d/57de9e838fa953e2fb5e358cd535603fb249b7d2/
>     http://autobuild.buildroot.org/results/e02/e023014934bf291add9d9dfdfc005bfec34dc1ff/
>     [...]
> 
> Note: since cramfs was last released in 2002-02-24, we don't stand a
> chance to get this merged any time soon... :-(
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/cramfs/0003-fix-missing-types.patch | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/cramfs/0003-fix-missing-types.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
