From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 20:10:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 31d947cf7156cf78d3f57e0bd82b33e6f6ece6b4
In-Reply-To: <1463410859-7543-1-git-send-email-martin@barkynet.com>
References: <1463410859-7543-1-git-send-email-martin@barkynet.com>
Message-ID: <20160516201040.0655ecc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 May 2016 16:00:59 +0100, Martin Bark wrote:
> Includes a fix for static builds using libgcrypt.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/55a7db5c0cbc34bbf6a2cbc52713d8822deec5b2
>  http://autobuild.buildroot.net/results/864d8901eb901182ce186cf9a845636040e242bb
>  http://autobuild.buildroot.net/results/aba522aa164267993fb1f1bbc57733be0cbea680
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/iputils/iputils.hash | 2 +-
>  package/iputils/iputils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
