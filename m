From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:45:55 +0200
Subject: [Buildroot] [PATCH 5/7] audit: update legal info
In-Reply-To: <1473935228-14014-5-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1473935228-14014-5-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160916184555.60b850b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 15:57:06 +0530, Rahul Bedarkar wrote:
> Programs are released under GPLv2+. README file says libraries
> libaudit.* and libauparse.* are released under LGPL but there are two
> files auparse/strsplit.c and lib/strsplit.c which are released under
> GPLv2+ which makes both libraries GPL. Until we review situation with
> upstream, we don't add license for libraries.
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/audit/audit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after taking into account Arnout's suggestion of
adding "unclear (libraries)" to the license information.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
