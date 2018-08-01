From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 16:47:54 +0200
Subject: [Buildroot] [PATCH 0/4] minicom: update to use latest git
 repository
In-Reply-To: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180801164754.72a97112@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 14:57:17 +0200, Giulio Benetti wrote:

> Giulio Benetti (4):
>   minicom: update package to use git repository.
>   minicom: add pre-configure hook to call autogen.sh
>   minicom: delete patches
>   minicom: delete hash file.

All these patches should be just one, otherwise your series is not
bisectable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
