From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:38:10 +0100
Subject: [Buildroot] [PATCH] ptpd2: explicitly point to pcap-config
In-Reply-To: <1453901901-26659-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453901901-26659-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160127213810.3fc65836@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 27 Jan 2016 10:38:21 -0300, Gustavo Zacarias wrote:
> Otherwise it will search in the usual places, and if the host has
> it it will try to build against that one, resulting in failure. Fixes:
> http://autobuild.buildroot.net/results/b39/b399ee830de587e3302f86ac0caadd2607c6c43c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ptpd2/ptpd2.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
