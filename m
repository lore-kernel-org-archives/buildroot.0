From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 20:10:50 +0200
Subject: [Buildroot] [PATCH] mtd: add mtdpart option
In-Reply-To: <1438687178-26675-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438687178-26675-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150828201050.2abd0127@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  4 Aug 2015 08:19:38 -0300, Gustavo Zacarias wrote:
> As pointed by J?rg Krause one of the novelties of the 1.5.2 release is
> the new mtdpart tool, so add an option for it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mtd/Config.in | 3 +++
>  package/mtd/mtd.mk    | 1 +
>  2 files changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
