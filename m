From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:13:50 +0100
Subject: [Buildroot] [PATCH next 1/1] package/flac: Rename patch
In-Reply-To: <1417341053-10093-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417341053-10093-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141130151350.114c8f6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 30 Nov 2014 10:50:53 +0100, Bernd Kuhls wrote:
> *.txt are not recognized as patches.
> This patch also fixes build with BR2_DEBUG_2=y.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...FLAGS.txt => 0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch} |    0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/flac/{0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt => 0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch} (100%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
