From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 04:07:06 +0100
Subject: [Buildroot] [PATCH v3] package/openfpgaloader: new package
In-Reply-To: <20200218083247.15882-1-jeanburgat33@gmail.com>
References: <20200218083247.15882-1-jeanburgat33@gmail.com>
Message-ID: <20200219040706.45794e58@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 09:32:47 +0100
Jean Burgat <jeanburgat33@gmail.com> wrote:

> openFPGALoader is a tool for programming FPGA.
> 
> Signed-off-by: Jean Burgat <jeanburgat33@gmail.com>
> ---
> Changes v2 -> v3
>  - hash: use 2 spaces (Heiko)
> Changes v1 -> v2
>  - openFPGALoader -> openfpgaloader (Thomas)
>  - merge DEVELOPERS in first patch (Thomas)
>  - select BR2_PACKAGE_ARGP_STANDALONE when non glibc (Thomas)
> ---
>  DEVELOPERS                                 |  3 +++
>  package/Config.in                          |  1 +
>  package/openfpgaloader/Config.in           | 18 ++++++++++++++++++
>  package/openfpgaloader/openfpgaloader.hash |  3 +++
>  package/openfpgaloader/openfpgaloader.mk   | 18 ++++++++++++++++++
>  5 files changed, 43 insertions(+)
>  create mode 100644 package/openfpgaloader/Config.in
>  create mode 100644 package/openfpgaloader/openfpgaloader.hash
>  create mode 100644 package/openfpgaloader/openfpgaloader.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
