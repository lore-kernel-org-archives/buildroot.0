From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 22:40:00 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: bump to version 87286ee (beta)
In-Reply-To: <1473148267-18593-1-git-send-email-fabrice.fontaine@orange.com>
References: <1473148267-18593-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160906224000.305fa34b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Sep 2016 09:51:07 +0200, Fabrice Fontaine wrote:
> This version includes the patch on execinfo
> (commit 775da272719b52bca37b44a40e935a1eb9d10466) so remove
> the 0001-add-proper-check-for-detecting-header-execinfo.h.patch file
> 
> This version also fixes arc and musl build (ambiguous call to abs and
> missing linux/ioctl header):
>   http://autobuild.buildroot.net/results/b5406ca587592a3bac446d1f1df93d3eb45b96a9 fixed by commit 331cd7d6eef6f9f2658b91e662644d88c31eaf64
>   http://autobuild.buildroot.net/results/62ec0d348153dff0efd4c1975a9198c17f01f1fa fixed by commit 6ea21db228124565466bf16b0400d40a5eaad30d
> 
> Due to DOS line endings, it is easier to reference this beta release
> than converting git patches.
> The stable release should be released in the first week of October.
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  ...per-check-for-detecting-header-execinfo.h.patch | 58 ----------------------
>  package/domoticz/domoticz.hash                     |  2 +-
>  package/domoticz/domoticz.mk                       |  2 +-
>  3 files changed, 2 insertions(+), 60 deletions(-)
>  delete mode 100644 package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
