From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 21:56:55 +0100
Subject: [Buildroot] [PATCH] fastd: needs host-bison and host-pkgconf
In-Reply-To: <1446740938-9782-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446740938-9782-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151105215655.20e14f11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  5 Nov 2015 13:28:58 -0300, Gustavo Zacarias wrote:
> Fixes (missing host-bison):
> http://autobuild.buildroot.net/results/237/2371c98112a416f4d9d32576f207dad8d80ac537
> 
> host-pkgconf derived from $(@D)/cmake/deps.cmake
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/fastd/fastd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
