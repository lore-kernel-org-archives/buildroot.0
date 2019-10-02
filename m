From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:15:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/ytree: fix musl build
In-Reply-To: <20191001175911.16028-2-bernd.kuhls@t-online.de>
References: <20191001175911.16028-1-bernd.kuhls@t-online.de>
 <20191001175911.16028-2-bernd.kuhls@t-online.de>
Message-ID: <20191002211506.583d5260@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Oct 2019 19:59:11 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ytree/0001-fix-musl.patch | 23 +++++++++++++++++++++++
>  package/ytree/Config.in           |  5 -----
>  2 files changed, 23 insertions(+), 5 deletions(-)
>  create mode 100644 package/ytree/0001-fix-musl.patch

Applied to master after improving the commit log of the patch, as
suggested by Peter Seiderer.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
