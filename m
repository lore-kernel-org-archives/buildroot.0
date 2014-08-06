From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 23:04:59 +0200
Subject: [Buildroot] [PATCH] toolchain: fix 3.16 selection for custom
 version
In-Reply-To: <1407356267-3005-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407356267-3005-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140806230459.691e8947@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  6 Aug 2014 17:17:47 -0300, Gustavo Zacarias wrote:
> Fix d'oh typo from 911516f1b6dec4b2985a1f454949f8d9d10f6ef5 that
> prevents custom version string 3.16 headers from working properly.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/linux-headers/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
