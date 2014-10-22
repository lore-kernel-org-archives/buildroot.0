From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 21:38:23 +0200
Subject: [Buildroot] [PATCH] iptables: disable static for dynamic builds
In-Reply-To: <1413910694-21496-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413910694-21496-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141022213823.71de806c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 21 Oct 2014 13:58:14 -0300, Gustavo Zacarias wrote:
> It leads to ugly runtime warnings, see:
> http://patchwork.ozlabs.org/patch/386215/
> It's also required for xtables-addons.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/iptables/iptables.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
