From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 21:02:12 +0200
Subject: [Buildroot] [PATCH] itop: new package
In-Reply-To: <20180329195247.24360-1-alexandre.belloni@bootlin.com>
References: <20180329195247.24360-1-alexandre.belloni@bootlin.com>
Message-ID: <20181020210212.39ce484c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alex,

On Thu, 29 Mar 2018 21:52:47 +0200, Alexandre Belloni wrote:
> itop is a simple top-like interrupt load monitor. It can be useful to
> debug interrupt issues.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/itop/Config.in |  4 ++++
>  package/itop/itop.hash |  5 +++++
>  package/itop/itop.mk   | 21 +++++++++++++++++++++
>  5 files changed, 32 insertions(+)
>  create mode 100644 package/itop/Config.in
>  create mode 100644 package/itop/itop.hash
>  create mode 100644 package/itop/itop.mk

Peter Korsgaard made a number of comments/suggestions on this patch
back in March, but no new version has been posted since then. I've
marked this patch as Changes Requested in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
