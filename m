From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 23:38:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/ytree: new package
In-Reply-To: <20190904212117.21861-1-bernd.kuhls@t-online.de>
References: <20190904212117.21861-1-bernd.kuhls@t-online.de>
Message-ID: <20190915233804.19191c80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Sep 2019 23:21:17 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/ytree/Config.in  |  7 +++++++
>  package/ytree/ytree.hash |  3 +++
>  package/ytree/ytree.mk   | 31 +++++++++++++++++++++++++++++++
>  5 files changed, 43 insertions(+)
>  create mode 100644 package/ytree/Config.in
>  create mode 100644 package/ytree/ytree.hash
>  create mode 100644 package/ytree/ytree.mk

Applied to master, thanks. I however changed its location in menuconfig
from "Text editors and viewers" to "Utilities", as "Text editors and
viewers" didn't seem very appropriate for a file manager. I know "mc"
is in "Text editors and viewers", but it's probably not the right place
either. "Utilities" already contained "ranger", which is another file
manager.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
