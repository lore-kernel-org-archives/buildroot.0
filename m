From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:41:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/pigz: add host package support
In-Reply-To: <20200310095816.5404-1-lpdev@cordier.org>
References: <20200310095816.5404-1-lpdev@cordier.org>
Message-ID: <20200322224155.5e5a0eb7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 10:58:16 +0100
Louis-Paul Cordier <lpdev@cordier.org> wrote:

> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
> ---
>  package/Config.in.host      |  1 +
>  package/pigz/Config.in      |  1 +
>  package/pigz/Config.in.host |  9 +++++++++
>  package/pigz/pigz.mk        | 10 ++++++++++
>  4 files changed, 21 insertions(+)
>  create mode 100644 package/pigz/Config.in.host

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
