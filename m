From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:53:25 +0200
Subject: [Buildroot] [PATCH v2] aiccu: musl patches
In-Reply-To: <20150325221506.GA26834@vostro>
References: <20150325221506.GA26834@vostro>
Message-ID: <20150329145325.2042511d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Thu, 26 Mar 2015 00:15:06 +0200, Alex Suykov wrote:
> Fixes
> http://autobuild.buildroot.net/results/8c666ef11310868097601b6de1dd25779729b878/
> 
> if_ether.h issue discussion: http://www.openwall.com/lists/musl/2012/10/11/1
> 
> Patch 0001-gnutls-and-uclibc-fixes split into gnutls part (0001) and res_ninit
> part (0005) which is not uclibc-specific but happens to affect musl as well.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
