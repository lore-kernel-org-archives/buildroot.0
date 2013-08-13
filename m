From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:50:26 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: fix static build
In-Reply-To: <1376315409-12258-1-git-send-email-s.martin49@gmail.com>
References: <1376315409-12258-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20130813115026.2cf4672a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 12 Aug 2013 15:50:09 +0200, Samuel Martin wrote:
> When static build and sqlite3 support are enabled together,
> link flags needs to be defined in the right order.
> 
> Fixes http://autobuild.buildroot.org/results/a74/a74ced69052c1d0a91dbe32483fd0612d1bf24a
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/aircrack-ng/aircrack-ng.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
