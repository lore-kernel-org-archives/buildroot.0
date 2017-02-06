From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 14:06:13 +0100
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: Fix debugfs ls -p option
In-Reply-To: <1485313818-842-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1485313818-842-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170206140613.26af8c90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jan 2017 21:10:18 -0600, Matt Weber wrote:
> From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> The debugfs "ls -p" option can print out invalid characters that the
> other ls options do not print out. This patch fixes the issue by
> utilizing the same file name print function that the other ls options
> use.
> 
> Upstream: https://patchwork.ozlabs.org/patch/707942/
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

This patch has been rejected by the upstream project, so I'll also
reject it in Buildroot as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
