From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 22:21:53 +0200
Subject: [Buildroot] [PATCH v2] package/python-pillow: fix wrong install
 step
In-Reply-To: <1467835677-3867-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1467835677-3867-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160706222153.141c3600@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jul 2016 22:07:57 +0200, Angelo Compagnucci wrote:
> This patch changes PYTHON_PILLOW_INSTALL_TARGET_CMDS to actually
> install pillow in target directory instead of host.
> It also fixes the version for the hash.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changes:

Applied to master with some minor tweaks, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
