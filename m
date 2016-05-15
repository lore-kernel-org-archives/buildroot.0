From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:22:39 +0200
Subject: [Buildroot] [PATCH 4/4] gmrender-resurrect: disable on musl
 configurations
In-Reply-To: <1463235434-31134-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463235434-31134-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160515212239.767a45a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 16:17:14 +0200, Thomas Petazzoni wrote:
> gmrender-resurrect uses <error.h>, which isn't available on musl
> configuration, so let's disable this package in such situations.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/96a280a8115cd01d64670e4caf2471d3ee4581d9/
>   (and numerous similar build failures)
> 
> Cc: kei-k at ca2.so-net.ne.jp <kei-k@ca2.so-net.ne.jp>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gmrender-resurrect/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
