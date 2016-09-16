From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:43:23 +0200
Subject: [Buildroot] [PATCH 2/7] util-linux: add optional dependency on
 audit
In-Reply-To: <1473935228-14014-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1473935228-14014-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160916184323.294a1303@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 15:57:03 +0530, Rahul Bedarkar wrote:
> login and hwclock can be built with audit support. This patch adds
> optional dependency on audit package if it is already selected.
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/util-linux/util-linux.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
