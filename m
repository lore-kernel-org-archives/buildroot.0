From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Sep 2015 16:29:10 +0200
Subject: [Buildroot] [PATCH] pkg-cmake: change sed expression delimiter
In-Reply-To: <1442861856-31321-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1442861856-31321-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20150922162910.4e8247ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Mon, 21 Sep 2015 15:57:36 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Switch from : to # since CFLAGS can include :'s spilled in from
> BR2_TARGET_OPTIMIZATION, for example:
> 
> BR2_TARGET_OPTIMIZATION="-Wl,-rpath,/lib:/usr/lib" would cause the sed
> expression to fail thus breaking the build.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/pkg-cmake.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
