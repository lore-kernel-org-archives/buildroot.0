From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 09:49:27 +0200
Subject: [Buildroot] [PATCH v5 1/4] arch: add support for Andes
 32-bit(nds32)
In-Reply-To: <20190416072545.17633-2-nylon7@andestech.com>
References: <20190416072545.17633-1-nylon7@andestech.com>
 <20190416072545.17633-2-nylon7@andestech.com>
Message-ID: <20190417094927.6863d5cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Apr 2019 15:25:42 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> This commit provides basic support for the Andes 32-bit(nds32) architecture.
> 
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  DEVELOPERS           |  3 +++
>  arch/Config.in       | 12 ++++++++++++
>  arch/Config.in.nds32 | 11 +++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 arch/Config.in.nds32

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
