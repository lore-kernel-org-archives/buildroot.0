From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 00:17:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/proftpd: add upstream security
 fix for CVE-2019-12815
In-Reply-To: <20190723174310.10779-1-bernd.kuhls@t-online.de>
References: <20190723174310.10779-1-bernd.kuhls@t-online.de>
Message-ID: <20190724001737.3d9568cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jul 2019 19:43:10 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/proftpd/0002-fix-CVE-2019-12815.patch | 382 ++++++++++++++++++
>  package/proftpd/proftpd.hash                  |   1 +
>  2 files changed, 383 insertions(+)
>  create mode 100644 package/proftpd/0002-fix-CVE-2019-12815.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
