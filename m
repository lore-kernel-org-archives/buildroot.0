From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:30:23 +0100
Subject: [Buildroot] [PATCH] package/benejson: only buid static/shared
 as needed
In-Reply-To: <1422829134-25652-1-git-send-email-yann.morin.1998@free.fr>
References: <1422829134-25652-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150201233023.671a1375@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  1 Feb 2015 23:18:54 +0100, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/56a/56a721885c890f3d62bf9e13d712767e66937c51/
>     http://autobuild.buildroot.org/results/7c5/7c54dce4801a53bec378b422edfa42dfa990eabe/
>     [...]
> 
> Patch-from: Alex Suykov <alex.suykov@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/benejson/benejson.mk | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
