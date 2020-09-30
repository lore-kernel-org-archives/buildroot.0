From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:50:18 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/log4cxx: fix build without wchar
In-Reply-To: <20200928191730.36288-1-fontaine.fabrice@gmail.com>
References: <20200928191730.36288-1-fontaine.fabrice@gmail.com>
Message-ID: <20200930225018.30454a80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Sep 2020 21:17:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build with log4cxx in version 0.11.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bab5329fdeb894471bfd5192ce04d3fbd2f9be5c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Retrieve upstream patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
