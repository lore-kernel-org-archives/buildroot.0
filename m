From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 14:46:55 +0200
Subject: [Buildroot] [PATCH v3 2/3] qt5webengine: update chromium
 license file names for qt-latest
In-Reply-To: <20180830100647.11098-1-laurent.hartanerot@gmail.com>
References: <20180829063034.10766-1-laurent.hartanerot@gmail.com>
 <20180830100647.11098-1-laurent.hartanerot@gmail.com>
Message-ID: <20180901144655.1401bbef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 12:06:47 +0200, Laurent Hartanerot wrote:
> From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> 
> Update license file name for qt5webengine-5.11
> 
> Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
> ---
>  package/qt5/qt5webengine/chromium-latest.inc | 431 +++++++++++++++++++++++++++
>  package/qt5/qt5webengine/chromium.inc        | 310 -------------------
>  package/qt5/qt5webengine/qt5webengine.mk     |   2 +-
>  3 files changed, 432 insertions(+), 311 deletions(-)
>  create mode 100644 package/qt5/qt5webengine/chromium-latest.inc
>  delete mode 100644 package/qt5/qt5webengine/chromium.inc

This should have been split into two patches: one remaining the file
and one fixing the contents. So I've split it into two, and applied to
master. Also, I've improved the commit logs along the way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
