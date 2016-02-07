From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 14:31:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseview: update musl patch
In-Reply-To: <1454850622-9888-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454850622-9888-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207143110.35530abf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  7 Feb 2016 14:10:22 +0100, Bernd Kuhls wrote:
> Upstream requested to update the source of the musl patch:
> http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1954
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/pulseview/0001-musl.patch | 54 +++++++++++++++++++++++++++++++++++++++
>  package/pulseview/pulseview.mk    |  4 ---
>  2 files changed, 54 insertions(+), 4 deletions(-)
>  create mode 100644 package/pulseview/0001-musl.patch

Applied, thanks. I would have preferred to continue download the patch,
but the Gitweb URL is full of ? and ; characters, which don't seem to
play well with our download infra.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
