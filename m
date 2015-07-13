From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:13:26 +0200
Subject: [Buildroot] [PATCH v4 3/9] toolchain/helpers.mk: use --chmod on
 rsync
In-Reply-To: <1416586748-12936-4-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416586748-12936-4-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150713171326.77067b19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 21 Nov 2014 13:19:02 -0300, Guido Mart?nez wrote:
> This makes sure we don't have any weird permissions on the staging dir,
> which could affect the target.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  toolchain/helpers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
