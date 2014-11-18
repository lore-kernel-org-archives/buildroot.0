From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:59:27 +0100
Subject: [Buildroot] [PATCH v3 5/5] package: linux-fusion: use install
 instead of cp
In-Reply-To: <1416244750-24256-6-git-send-email-guido@vanguardiasur.com.ar>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-6-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141118235927.5d496b15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Mon, 17 Nov 2014 14:19:10 -0300, Guido Mart?nez wrote:
> in order to not depend on the previous permissions of the file
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  package/linux-fusion/linux-fusion.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
