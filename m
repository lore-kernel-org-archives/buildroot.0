From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 09:14:36 +0200
Subject: [Buildroot] [git commit] configs/imx6q-sabresd: Drop the 'quad'
 notation
In-Reply-To: <20170926222615.730DA8045D@busybox.osuosl.org>
References: <20170926222615.730DA8045D@busybox.osuosl.org>
Message-ID: <20170927091436.62fd5130@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 00:26:50 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=d5935bf70dc89c639bd7e2a7eed0578a7673edca
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Now that SPL is supported a single image can run on the different
> variants of imx6 sabresd boards: imx6q, imx6dl and imx6qp.
> 
> So drop the 'quad' prefix from defconfig, directory and readme file
> to make it generic.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .../linux_qt5.fragment                             |  0
>  .../{imx6q-sabresd => imx6-sabresd}/readme.txt     | 23 +++++++++++++---------
>  .../rootfs_overlay/root/sabresd.json               |  0
>  ...6q-sabresd_defconfig => imx6-sabresd_defconfig} |  0
>  configs/imx6q-sabresd_qt5_defconfig                |  4 ++--

Isn't this missing an update to .gitlab-ci.yml ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
