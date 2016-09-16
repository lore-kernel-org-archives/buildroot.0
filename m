From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:44:10 +0200
Subject: [Buildroot] [PATCH 3/7] audit: disable autoreconf
In-Reply-To: <1473935228-14014-3-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1473935228-14014-3-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160916184410.7d59bd4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 15:57:04 +0530, Rahul Bedarkar wrote:
> Commit upstream 51925b7dd6d0("package/audit: Bump to version 2.6.5")
> removed patch 0002 as part of version bump. But forgot to disable
> autoreconf.
> 
> Fixes: 51925b7dd6d0("package/audit: Bump to version 2.6.5")
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/audit/audit.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
