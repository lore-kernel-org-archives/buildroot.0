From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:41:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: add optional support
 for linux-pam
In-Reply-To: <20180801132114.24273-1-apanfilov@spectracom.com>
References: <20180801132114.24273-1-apanfilov@spectracom.com>
Message-ID: <20180805144127.169fa4b7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 16:21:14 +0300, Artem Panfilov wrote:
> Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
> ---
>  package/pure-ftpd/pure-ftpd.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master after adding an explicit --without-pam, as suggested
by Bernd.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
