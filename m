From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 20:09:55 +0100
Subject: [Buildroot] [PATCH] aiccu: musl patches
In-Reply-To: <20150324223049.GA4134@vostro>
References: <20150324223049.GA4134@vostro>
Message-ID: <20150325200955.6a0e54c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Wed, 25 Mar 2015 00:30:49 +0200, Alex Suykov wrote:
> Fixes
> http://autobuild.buildroot.net/results/8c666ef11310868097601b6de1dd25779729b878/
> 
> if_ether.h issue discussion: http://www.openwall.com/lists/musl/2012/10/11/1
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/aiccu/0004-if-ether-header.patch | 23 +++++++++++++++++++++++
>  package/aiccu/0005-res-ninit.patch       | 22 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/aiccu/0004-if-ether-header.patch
>  create mode 100644 package/aiccu/0005-res-ninit.patch

Thanks. What is the upstreaming plan for those patches?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
