From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 14:47:42 +0200
Subject: [Buildroot] [PATCH v3 3/3] qt5webengine: Rename internal
 variable to qt5webengine
In-Reply-To: <20180830100703.11153-1-laurent.hartanerot@gmail.com>
References: <20180829063034.10766-1-laurent.hartanerot@gmail.com>
 <20180830100703.11153-1-laurent.hartanerot@gmail.com>
Message-ID: <20180901144742.303ce80f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 12:07:03 +0200, Laurent Hartanerot wrote:
> From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> 
> Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
> ---
>  package/qt5/qt5webengine/chromium-latest.inc | 2 +-
>  package/qt5/qt5webengine/chromium-lts.inc    | 2 +-
>  package/qt5/qt5webengine/qt5webengine.mk     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

There should have been a non-empty commit log, so I've added some
details, and applied to master.

Please remember that commit logs should document why we are doing the
change, so an empty commit log is almost always wrong.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
