From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 15:52:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/iproute2: Bump version to 5.11.0
In-Reply-To: <20210323181004.25172-1-petr.vorel@gmail.com>
References: <20210323181004.25172-1-petr.vorel@gmail.com>
Message-ID: <20210404155259.196253ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Tue, 23 Mar 2021 19:10:04 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> NOTE: this should not be applied until uclibc based toolchains are
> regenerated. But posted for people who don't use uclibc and would like
> to have iproute2 sync with kernel version.

I think they have all been updated now. However, your patch doesn't
apply: it assumes that Buildroot master has iproute2 5.8.0, but we have
5.7.0. And the patch we have in package/iproute2/ doesn't apply to
5.11.0. Could you have a look and respin?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
