From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 11:22:49 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: Move all kodi packages to
 subdirectories of package/kodi/
In-Reply-To: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150614112249.5edc2e52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Jun 2015 11:10:30 +0200, Bernd Kuhls wrote:
> Kodi 15.0 Isengard will contain new support for binary addons.
> To prevent adding all those new packages to the root level of package/
> introduce a new main hierarchy starting from package/kodi/.
> 
> This patch moves the current Kodi 14.2 Helix packages to this new
> directory in preparation for the upcoming version bump.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

We went exactly the other way around recently with moving up all the
matchbox packages back to package/ directory.

So, why would we want to do the opposite for Kodi ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
