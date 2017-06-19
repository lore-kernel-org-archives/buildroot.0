From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 09:41:37 +0200
Subject: [Buildroot] [PATCH v4 0/6] Board: Add Engicam i.MX6 SOMs
In-Reply-To: <1497857252-8308-1-git-send-email-jteki@openedev.com>
References: <1497857252-8308-1-git-send-email-jteki@openedev.com>
Message-ID: <20170619094137.64636ea9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 12:57:26 +0530, Jagan Teki wrote:

> Jagan Teki (6):
>   board: Add support for Engicam i.CoreM6 DualLite/Solo boards
>   board: engicam: Rename defconfig engicam_imx6qdl_icore_mmc_defconfig
>   board: Add support for Engicam i.CoreM6 RQS SOM
>   board: engicam: Add icorem6 for i.CoreM6 support
>   board: Add support for Engicam GEAM6UL SOM
>   board: Add support for Engicam Is.IoT MX6UL SOM

Thanks for this new iteration and those contributions. Since you're
regularly posting new iterations of this patch series, it would be nice
if you could create an account on patchwork, and mark yourself the
previous iterations of your patch series as "Superseded". This way, it
is easier for the maintainers to keep track of what is the latest
version of your patch series that should be considered for
review/merging.

See https://patchwork.ozlabs.org/project/buildroot/list/. You just need
to create an account with the same e-mail address as the one used to
send the patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
