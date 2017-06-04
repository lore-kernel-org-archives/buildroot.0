From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:47:00 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: revert the removal of
 0001-drop-configh-from-tools.patch
In-Reply-To: <20170603172410.17504-1-romain.naour@gmail.com>
References: <20170603172410.17504-1-romain.naour@gmail.com>
Message-ID: <20170604094700.05c93c35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 19:24:10 +0200, Romain Naour wrote:
> Patch 0001-drop-configh-from-tools.patch is not upstream, instead it
> must be rebased on top of 2017.05 release since the code was moved by
> [1].
> 
> Fixes:
> http://autobuild.buildroot.net/results/949/94910513d1b14e3b02ec4aed34de89d1b1d7a12a
> 
> [1] http://git.denx.de/?p=u-boot.git;a=commit;h=9d80b49a671c9922931adcd823aab0ed319a42d1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc:  Fabio Estevam <festevam@gmail.com>
> ---
>  .../uboot-tools/0001-drop-configh-from-tools.patch | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/uboot-tools/0001-drop-configh-from-tools.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
