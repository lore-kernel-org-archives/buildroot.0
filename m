From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:29:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: bump version to
 2.7
In-Reply-To: <20181215143107.5289-1-bernd.kuhls@t-online.de>
References: <20181215143107.5289-1-bernd.kuhls@t-online.de>
Message-ID: <20181216122918.2f3221b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Dec 2018 15:31:06 +0100, Bernd Kuhls wrote:
> Removed upstream patches included in the new version.
> Added upstream patch to fix build error.
> 
> Updated license hash after commit
> http://w1.fi/cgit/hostap/commit/README?id=c2c6c01bb8b6fafc2074b46a53c4eab2c145ac6f
> updated the copyright year.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...pplicant-2.7-fix-undefined-remove-ie.patch | 43 +++++++++++++++++++
>  package/wpa_supplicant/wpa_supplicant.hash    | 12 +-----
>  package/wpa_supplicant/wpa_supplicant.mk      | 11 +----
>  3 files changed, 46 insertions(+), 20 deletions(-)
>  create mode 100644 package/wpa_supplicant/0001-wpa_supplicant-2.7-fix-undefined-remove-ie.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
