From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:16:26 +0100
Subject: [Buildroot] [PATCH v2] qt5connectivity: new package
In-Reply-To: <1387978594-16692-1-git-send-email-fatih.asici@gmail.com>
References: <1387978594-16692-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20131225181626.5cad21e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Wed, 25 Dec 2013 15:36:34 +0200, Fatih A??c? wrote:
> QtNfc is not installed since it is not supported on Linux.
> 
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
> Changes v1 -> v2:
>   - propagate bluez_utils dependencies !BR2_avr32 and BR2_USE_MMU
>     (Suggested by Thomas Petazzoni)
> ---
>  package/qt5/Config.in                          |  1 +
>  package/qt5/qt5connectivity/Config.in          | 15 ++++++++
>  package/qt5/qt5connectivity/qt5connectivity.mk | 49 ++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
>  create mode 100644 package/qt5/qt5connectivity/Config.in
>  create mode 100644 package/qt5/qt5connectivity/qt5connectivity.mk

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
