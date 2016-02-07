From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 14:25:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: update musl patch
In-Reply-To: <1454845944-17512-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454845944-17512-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207142529.11f3e84b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  7 Feb 2016 12:52:24 +0100, Bernd Kuhls wrote:
> Upstream chose a different fix:
> http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1951
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...01-beaglelogic.h-fix-build-with-musl-libc.patch | 46 +++++++++++-----------
>  1 file changed, 22 insertions(+), 24 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
