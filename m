From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 23:58:30 +0200
Subject: [Buildroot] [PATCH] package/weston: mark the RDP backend as
 broken
In-Reply-To: <1440025582-7065-1-git-send-email-yann.morin.1998@free.fr>
References: <1440025582-7065-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150820235830.016925d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 20 Aug 2015 01:06:22 +0200, Yann E. MORIN wrote:
> weston needs FreeRDP from master, as it uses new settings only
> introduced in there.
> 
> Since it is too late in the release cycle to bump FreeRDP, just mark the
> weston RDP backend as broken.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/ef6/ef685a41a56e81dc93a40f23f8cd55860f44e055/
>     http://autobuild.buildroot.org/results/c42/c42d72498e05364a718748caef74bba6c423d7d1/
>     http://autobuild.buildroot.org/results/c78/c783695a5b1a18976361ea36627505b281b11781/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/weston/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
