From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 16:05:15 +0200
Subject: [Buildroot] [PATCH v2] Revert "boot/uboot: allow to build
 multiple U-Boot images"
In-Reply-To: <1475761393-29715-1-git-send-email-fabio.estevam@nxp.com>
References: <1475761393-29715-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20161007160515.2a6bc730@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Oct 2016 10:43:13 -0300, Fabio Estevam wrote:
> This reverts commit fad58cefa4a392b52eafe46a773f8cbfb8aadb43.
> 
> Since commit fad58cefa4a392b ("boot/uboot: allow to build multiple U-Boot
> images") the installation of SPL binary fails.

I don't think we want to revert this patch. Instead, we want to call
"make all" unconditionally.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
