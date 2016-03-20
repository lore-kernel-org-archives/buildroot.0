From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:00:56 +0100
Subject: [Buildroot] [PATCH 3/3] package/kodi: needs host gcc >= 4.6
In-Reply-To: <1458419136-9094-3-git-send-email-bernd.kuhls@t-online.de>
References: <1458419136-9094-1-git-send-email-bernd.kuhls@t-online.de>
 <1458419136-9094-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160320150056.02921fa2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 19 Mar 2016 21:25:36 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...exturePacker-fix-compilation-with-gcc-4.6.patch | 57 ++++++++++++++++++++++
>  package/kodi/Config.in                             |  4 +-
>  2 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100644 package/kodi/0006-native-TexturePacker-fix-compilation-with-gcc-4.6.patch

Same issues in the patch, which I've fixed as well. Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
