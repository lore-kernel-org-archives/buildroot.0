From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 22:27:19 +0100
Subject: [Buildroot] [PATCH] icu: fix build failure for musl
In-Reply-To: <20161212205425.29423-1-gustavo@zacarias.com.ar>
References: <20161212205425.29423-1-gustavo@zacarias.com.ar>
Message-ID: <20161212222719.154a5e0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 17:54:25 -0300, Gustavo Zacarias wrote:
> musl doesn't have xlocale.h, and stdtod_l is crippled, so disable it.
> See thread from OE:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-November/128527.html
> Fixes:
> http://autobuild.buildroot.net/results/6ca/6caebf0f6c4adf66e67bedd0f04155413a9aa7bd/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/icu/icu.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
