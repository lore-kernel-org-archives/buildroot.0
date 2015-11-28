From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:37:00 +0100
Subject: [Buildroot] [PATCH 5/7 v3] autobuild: avoid infinite loop when
 sanitising the configuration
In-Reply-To: <003627a7778af3a996b720e7058cd3a757387fec.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
 <003627a7778af3a996b720e7058cd3a757387fec.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <20151128153700.6748e1c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 27 Nov 2015 23:39:12 +0100, Yann E. MORIN wrote:
> There are (hard-to-debug) cases where we can't quickly converge to a
> valid configuration. In which case, the sanitising loop is just a plain
> infinite loop.
> 
> Limit the loop to at most 100 (arbitrary) iterations, so we're not
> forever stuck.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  scripts/autobuild-run | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
