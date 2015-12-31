From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 10:36:03 +0100
Subject: [Buildroot] [PATCH 1/1] Fix VCS folders not being excluded from
 rootfs
In-Reply-To: <1451515564-10008-1-git-send-email-nford@westpond.com>
References: <1451515564-10008-1-git-send-email-nford@westpond.com>
Message-ID: <20151231103603.0aa5c352@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathan,

On Wed, 30 Dec 2015 17:46:04 -0500, Nathan Ford wrote:
> There is a typo in skeleton.mk preventing rsync from excluding VCS
> folders such as .svn
> 
> Signed-off-by: Nathan Ford <nford@westpond.com>
> ---
>  package/skeleton/skeleton.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks a lot for spotting this mistake! I've just amended the
commit title to contain the name of the affected package as a prefix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
