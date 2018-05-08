From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:27:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/apr-util: add optional support
 for postgresql
In-Reply-To: <20180504182615.8674-1-bernd.kuhls@t-online.de>
References: <20180504182615.8674-1-bernd.kuhls@t-online.de>
Message-ID: <20180508152713.50e8cded@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 May 2018 20:26:14 +0200, Bernd Kuhls wrote:
> apr-util contains optional support for postgresql:
> 
> $ ls -1 output/target/usr/lib/apr-util-1/apr_dbd_pg*
> output/target/usr/lib/apr-util-1/apr_dbd_pgsql-1.so
> output/target/usr/lib/apr-util-1/apr_dbd_pgsql.la
> output/target/usr/lib/apr-util-1/apr_dbd_pgsql.so
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apr-util/apr-util.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
