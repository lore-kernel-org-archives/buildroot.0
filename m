From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:27:54 +0200
Subject: [Buildroot] [PATCH] package/libcec: needs gcc >= 4.7
In-Reply-To: <1438797957-14814-1-git-send-email-yann.morin.1998@free.fr>
References: <1438797957-14814-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150806082754.540d2a00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  5 Aug 2015 20:05:57 +0200, Yann E. MORIN wrote:
> As per upstream, gcc-4.7 is required to build libcec:
>     https://github.com/Pulse-Eight/libcec/issues/78#issuecomment-91578591
> 
> Fixes:
>     http://autobuild.buildroot.org/results/3b5/3b5611725c13668472482ed4ad3b46886d4c63d9/
>     http://autobuild.buildroot.org/results/0d0/0d032cdd8dbf6d0ddef392c3e5a734881e00ee64/
>     http://autobuild.buildroot.org/results/c21/c21c555c38261f6911349ff9fdac6edeb4debaac/
>     [...]
> 
> Possibly fixes:
>     http://autobuild.buildroot.org/results/4a7/4a7b2af2fc3924255ac89e18f4f5c90bb8383265/
>     http://autobuild.buildroot.org/results/dd6/dd61c186e6d85a9b30cd32edb74a52f7a4f73cc8/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in   | 4 +++-
>  package/libcec/Config.in | 6 ++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
