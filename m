From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:27:42 +0200
Subject: [Buildroot] [PATCH] package: Fix source path for systemd's
 service
In-Reply-To: <1436814390-32042-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436814390-32042-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150713222742.07d9a97a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Mon, 13 Jul 2015 21:06:30 +0200, Maxime Hadjinlian wrote:
> Otherwise the link would appear broken in output/target it's not that
> big a deal but at least it's coherent with what we already have.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/chrony/chrony.mk | 2 +-
>  package/dcron/dcron.mk   | 2 +-
>  package/exim/exim.mk     | 2 +-
>  package/inadyn/inadyn.mk | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
