From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 22:08:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] Added config option to expose
 browser remote control on the D-Bus system bus
In-Reply-To: <20210316094727.1881200-1-asweet@thegoodpenguin.co.uk>
References: <20210316094727.1881200-1-asweet@thegoodpenguin.co.uk>
Message-ID: <20210316220838.033faca3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Tue, 16 Mar 2021 09:47:27 +0000
Adrian Sweet <asweet@thegoodpenguin.co.uk> wrote:

> Signed-off-by: Adrian Sweet <asweet@thegoodpenguin.co.uk>
> ---
>  package/cog/Config.in | 5 +++++
>  package/cog/cog.mk    | 6 ++++++
>  2 files changed, 11 insertions(+)

Thanks a lot, I have applied your patch. There were a few minor issues
though: the indentation in the Config.in file was not correct (this is
spotted by running "make check-package") and the commit title was
missing the package name as a prefix. I fixed that up when applying.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
