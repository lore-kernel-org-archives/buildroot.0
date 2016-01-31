From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:04:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.2.7.6,
 fix musl build
In-Reply-To: <1454268652-24630-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454268652-24630-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131230448.3ea03c50@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 20:30:52 +0100, Bernd Kuhls wrote:
> According to
> https://gitweb.torproject.org/tor.git/plain/ReleaseNotes?id=tor-0.2.7.6
> "Tor 0.2.7.5 is the first stable release in the Tor 0.2.7 series."
> so this patch bumps to the stable 2.7 series.
> 
> This patch also fixes a musl build error not yet found by the
> autobuilders:
> 
>   CC       src/common/workqueue.o
> src/common/sandbox.c:51:25: fatal error: bits/signum.h: Datei oder Verzeichnis nicht gefunden
>  #include <bits/signum.h>
>                          ^
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tor/0001-openssl-libz.patch | 63 ++++++++++++++++++++++---------------
>  package/tor/tor.hash                |  2 +-
>  package/tor/tor.mk                  |  2 +-
>  3 files changed, 39 insertions(+), 28 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
