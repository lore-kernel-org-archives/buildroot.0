From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 12:14:04 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: needs headers >= 3.8
In-Reply-To: <1470437310-8399-1-git-send-email-yann.morin.1998@free.fr>
References: <1470437310-8399-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160806121404.3ab71c18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 00:48:30 +0200, Yann E. MORIN wrote:
> kms++ uses V4L2_MEMORY_DMABUF, which was only introduced in linux-3.8.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/8dc/8dcc74586d68195c72a58cb4944d05dd9f935fa1/
>     http://autobuild.buildroot.org/results/224/22467a530a146302ef74b11f69cb5cdc54240876/
>     http://autobuild.buildroot.org/results/0e5/0e576ec01bbbf68a05216f4459a8a0613c39c141/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/kmsxx/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
