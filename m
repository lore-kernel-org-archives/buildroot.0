From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:28:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libva-utils: fix non x11
 build
In-Reply-To: <20200111083228.59137-1-bernd.kuhls@t-online.de>
References: <20200111083228.59137-1-bernd.kuhls@t-online.de>
Message-ID: <20200111152848.327c88a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 09:32:28 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/70f/70fd6609fffdaa07be583420dab067da27b7d505/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks for the new patch. I always find it silly when people remove
bogus code using #if 0...#endif instead of just deleting it, but OK,
that's the patch that has been submitted upstream for now. Let's use it
as-is, we'll see what upstream applies in the end.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
