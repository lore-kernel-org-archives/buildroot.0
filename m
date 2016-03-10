From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:42:22 +0100
Subject: [Buildroot] [PATCH] connman: switch to BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1457572011-2749-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457572011-2749-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160310214222.1e7c6929@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed,  9 Mar 2016 22:06:51 -0300, Gustavo Zacarias wrote:
> Switch to BR2_TOOLCHAIN_HAS_SYNC_4 from BR2_sparc conditional since it's
> the correct one.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/connman/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
