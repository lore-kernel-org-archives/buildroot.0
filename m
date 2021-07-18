From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 19:52:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: concat files
 before passing to env image tool
In-Reply-To: <20210705121933.1055057-1-mirza.kapetanovic@gmail.com>
References: <20210625091900.811972-1-mirza.kapetanovic@gmail.com>
 <20210705121933.1055057-1-mirza.kapetanovic@gmail.com>
Message-ID: <20210718195246.5c6b0328@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon,  5 Jul 2021 14:19:33 +0200
Mirza Kapetanovic <mirza.kapetanovic@gmail.com> wrote:

> Fix BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE so that files are actually concatenated
> as described in the help text.
> 
> Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
> ---
>  package/uboot-tools/uboot-tools.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
