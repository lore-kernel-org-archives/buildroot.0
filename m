From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 22:53:45 +0200
Subject: [Buildroot] [PATCH v1 2/2] dmidecode: Enable for aarch64
In-Reply-To: <5a39bc20074e6dc63b2e07c1114fa172160bf7e3.1532460521.git.geoff@infradead.org>
References: <5a39bc20074e6dc63b2e07c1114fa172160bf7e3.1532460521.git.geoff@infradead.org>
Message-ID: <20180725225345.2f43886a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jul 2018 19:32:17 +0000, Geoff Levand wrote:
> arm64 systems support SMBIOS, so update the dmidecode config
> to allow building dmidecode for arm64.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/dmidecode/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
