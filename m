From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:55:20 +0100
Subject: [Buildroot] [PATCH 1/3] wpa_supplicant: modify .config rework
 order
In-Reply-To: <1393534031-696-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393534031-696-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140302165520.06770579@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 27 Feb 2014 17:47:09 -0300, Gustavo Zacarias wrote:
> Switch to first enable and then disable.
> Otherwise a wildcard enable can't have a single option disabled which is
> far more usual than the opposite (and required for a simple bump to
> version 2.1).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied the three patches of this series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
