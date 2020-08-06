From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 10:01:52 +0200
Subject: [Buildroot] [PATCH] package/busybox: Enable flags for use as
 systemd pager
In-Reply-To: <20200717101837.346354-1-nolange79@gmail.com>
References: <20200717101837.346354-1-nolange79@gmail.com>
Message-ID: <20200806100152.04e5d504@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jul 2020 12:18:36 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> If the less package is not enable and systemd is enabled,
> then configure the less applet to fully work with systemd.
> 
> systemd sets the flags for less in an environment variable
> and requires a few options for correct display.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/busybox/busybox.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
