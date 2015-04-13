From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 14:18:26 +0200
Subject: [Buildroot] [PATCH] package/makedevs: fixing missing return type
In-Reply-To: <1428906741-12906-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1428906741-12906-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150413141826.07d3dd5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 13 Apr 2015 08:32:21 +0200, Angelo Compagnucci wrote:
> This patch fixes a missing return type in bb_recursive function.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/makedevs/makedevs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
