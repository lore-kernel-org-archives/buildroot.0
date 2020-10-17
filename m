From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:30:24 +0200
Subject: [Buildroot] [PATCH] package/linux-firmware: add options for
 Broadcom BCM4366
In-Reply-To: <20200518083305.21239-1-zajec5@gmail.com>
References: <20200518083305.21239-1-zajec5@gmail.com>
Message-ID: <20201017143024.32cc6437@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 May 2020 10:33:05 +0200
Rafa? Mi?ecki <zajec5@gmail.com> wrote:

> From: Rafa? Mi?ecki <rafal@milecki.pl>
> 
> There are two groups of chipsets in the BCM4366 family requiring two
> different firmware files. Each is quite big (over 1 MiB) so use
> separated options for them.
> 
> Signed-off-by: Rafa? Mi?ecki <rafal@milecki.pl>
> ---
> Yann, Yegor: my previous e-mail didn't reach ML because I wasn't
> subscribed thus I'm resending it.
> ---
>  package/linux-firmware/Config.in         | 10 ++++++++++
>  package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
>  2 files changed, 22 insertions(+)

I've slightly tweaked the option names to be a bit more consistent with
existing option names, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
