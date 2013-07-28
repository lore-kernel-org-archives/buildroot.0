From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 17:41:18 +0200
Subject: [Buildroot] [PATCH 4/4] sunxi-cedar: add cedar hardware video
 decoding library
In-Reply-To: <1374277074-14455-5-git-send-email-spenser@gillilanding.com>
References: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
 <1374277074-14455-5-git-send-email-spenser@gillilanding.com>
Message-ID: <20130728174118.6e623547@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri, 19 Jul 2013 18:37:54 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/Config.in                  |  1 +
>  package/sunxi-cedar/Config.in      | 10 ++++++++
>  package/sunxi-cedar/sunxi-cedar.mk | 49 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
>  create mode 100644 package/sunxi-cedar/Config.in
>  create mode 100644 package/sunxi-cedar/sunxi-cedar.mk

I've renamed this package to sunxi-cedarx and modified the installation
steps to ensure libraries are installed with execution permissions.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
