From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 22:00:52 +0200
Subject: [Buildroot] [PATCH] mtr: bump to latest git version (newdns
 branch)
In-Reply-To: <1463243114-10163-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463243114-10163-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160515220052.78192b8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 13:25:14 -0300, Gustavo Zacarias wrote:
> This fixes the musl build issues and the need to specially patch for
> uClibc at the same time. Fixes:
> http://autobuild.buildroot.net/results/deb/debeb3ded02c3de63182c3433ff02062192d3fd1/
> 
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mtr/mtr.hash |  2 ++
>  package/mtr/mtr.mk   | 12 +-----------
>  2 files changed, 3 insertions(+), 11 deletions(-)
>  create mode 100644 package/mtr/mtr.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
