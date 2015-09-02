From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Sep 2015 09:11:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-kernel-module.mk: module
 build fails
In-Reply-To: <1441157873-12285-1-git-send-email-rdkehn@yahoo.com>
References: <1441157873-12285-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150902091159.2f52ea06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Tue,  1 Sep 2015 20:37:53 -0500, Doug Kehn wrote:
> Observed the following when building cryptodev-linux:
> >>> cryptodev-linux 1.7 Building kernel module(s)
> grep: /.config: No such file or directory
> ERROR: Kernel does not support loadable modules
> 
> Fix LINUX_DIR reference when determining if kernel configuration
> supports loadable modules.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

Indeed:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
