From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:20:44 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/lightning: fix build
 for static-only
In-Reply-To: <1439477908-24088-1-git-send-email-yann.morin.1998@free.fr>
References: <1439477908-24088-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150818112044.7e5b0e35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 13 Aug 2015 16:58:28 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/019/019b6f2ac034766a4266e20e5dcc229bec4a7222/
>     http://autobuild.buildroot.org/results/55d/55d30db7212863d9f898bb929f0c75d529036bad/
>     http://autobuild.buildroot.org/results/459/459ab12bc3eeb493f39efa2450bc829a351ee3a3/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/lightning/0003-no-check-no-doc.patch | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/lightning/0003-no-check-no-doc.patch

I've applied Baruch proposal of making the package unavailable for
static builds. If you are really interested in having lightning
available for static builds, implementing an upstream-acceptable
solution would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
