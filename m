From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:34:41 +0200
Subject: [Buildroot] [PATCH v2 3/3] docs: libtool patches are not
 handled by legal-info infrastructure.
In-Reply-To: <1471449670-13421-3-git-send-email-romain.naour@gmail.com>
References: <1471449670-13421-1-git-send-email-romain.naour@gmail.com>
 <1471449670-13421-3-git-send-email-romain.naour@gmail.com>
Message-ID: <20160819233441.04ad8056@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 18:01:10 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  docs/manual/legal-notice.txt     | 4 ++++
>  support/legal-info/README.header | 4 ++++
>  2 files changed, 8 insertions(+)

Applied to master, after taking into account the suggestion from Yann
(hopefully correctly).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
