From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 15:53:32 +0100
Subject: [Buildroot] [PATCH 15/16] package/kodi-visualisation-goom: bump
 version to 2.2.1-Leia
In-Reply-To: <20200309183938.2528-15-bernd.kuhls@t-online.de>
References: <20200309183938.2528-1-bernd.kuhls@t-online.de>
 <20200309183938.2528-15-bernd.kuhls@t-online.de>
Message-ID: <20200315155332.3a426cfc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Mar 2020 19:39:37 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-visualisation-goom/kodi-visualisation-goom.hash | 2 +-
>  package/kodi-visualisation-goom/kodi-visualisation-goom.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This patch broke legal-info, as the hash of src/Main.cpp had changed.
I've fixed that up by switching to using debian/copyright as the
license file, and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
