From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:27:21 +0200
Subject: [Buildroot] [PATCH] webkitgtk24: depends on gcc >= 4.8
In-Reply-To: <1438793152-27174-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438793152-27174-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150806082721.089aeb21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  5 Aug 2015 13:45:52 -0300, Gustavo Zacarias wrote:
> Webkit 2.4.x depends on gcc being >= 4.8.x so use the new
> BR2_TOOLCHAIN_GCC_AT_LEAST_X_Y knob and drop the manual x86* external
> toolchain exclusions.
> Follow up in the midori package as well.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/midori/Config.in      |  6 ++++--
>  package/webkitgtk24/Config.in | 11 +++--------
>  2 files changed, 7 insertions(+), 10 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
