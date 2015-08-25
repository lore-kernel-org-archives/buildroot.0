From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:53:11 +0200
Subject: [Buildroot] [PATCH] midori: depend on x11 backend for gtk3
In-Reply-To: <1440525883-29560-1-git-send-email-gustavo@zacarias.com.ar>
References: <1440525883-29560-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150825205311.7c5a92e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 25 Aug 2015 15:04:43 -0300, Gustavo Zacarias wrote:
> Mirror commit ba25711e for midori as well, otherwise gtk3 with non-X11
> backends can trigger build failures. Fixes:
> http://autobuild.buildroot.net/results/80ffdf54fd675fbff5a645784cd041cdf862154c/
> http://autobuild.buildroot.net/results/1c049845ade60de223296c77c8a70869c4db64f0/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/midori/midori.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
