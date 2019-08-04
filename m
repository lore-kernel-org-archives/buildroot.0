From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 11:17:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/ddrescue: remove patch
In-Reply-To: <20190804073636.1158-1-bernd.kuhls@t-online.de>
References: <20190804073636.1158-1-bernd.kuhls@t-online.de>
Message-ID: <20190804111719.4c55c358@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 09:36:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Not needed anymore after upstream change:
> https://lists.gnu.org/archive/html/bug-ddrescue/2017-02/msg00002.html
> 
> Build-tested using br-x86-64-core2-full.config
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-io.cc-add-stdio.h-include.patch      | 36 -------------------
>  1 file changed, 36 deletions(-)
>  delete mode 100644 package/ddrescue/0001-io.cc-add-stdio.h-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
