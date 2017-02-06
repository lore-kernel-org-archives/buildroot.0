From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 18:50:14 +0100
Subject: [Buildroot] [RFC: PATCH 2/3] system: allow auto net
 configuration with networkd
In-Reply-To: <1474113519-24713-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1474113519-24713-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170206185014.5e291980@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 13:58:38 +0200, Eric Le Bihan wrote:
> Allow automatic network configuration via systemd-networkd if selected.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  system/Config.in | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

I've applied, but in fact squashed into the previous patch as it really
is the same change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
