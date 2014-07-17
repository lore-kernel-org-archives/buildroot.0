From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 17:31:04 +0200
Subject: [Buildroot] [PATCH] pkg-autotools: fix bad GETTEXTIZE_OPT
 assignment
In-Reply-To: <1405601776-20042-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405601776-20042-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140717173104.7f3ea7cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Jul 2014 09:56:16 -0300, Gustavo Zacarias wrote:
> HOST_PKG_GETTEXTIZE_OPT should get assigned PKG_GETTEXTIZE_OPT and not
> PKG_GETTEXTIZE. Fixes:
> http://autobuild.buildroot.net/results/087/087e860173069f58fa9ceb2460d7455d31b2dff8/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pkg-autotools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
