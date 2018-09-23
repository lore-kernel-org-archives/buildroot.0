From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 21:06:30 +0200
Subject: [Buildroot] [PATCH v3 1/1] chrony: Update to 3.4
In-Reply-To: <20180921153516.31459-1-ferdinand@ombud.nl>
References: <20180921153516.31459-1-ferdinand@ombud.nl>
Message-ID: <20180923210630.18542c83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 17:35:16 +0200, Ferdinand van Aartsen wrote:
> Patch 0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch
> was applied upstream in this version, so it can be deleted.
> 
> Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
> ---
> Changes v2 -> v3:
>   - Fix commit style

Applied to master, thanks. Only minor nits are on the commit title:

 - We prefer without capitalization, i.e "update to..."

 - For version bumps, we generally use "bump to version XYZ" as the
   commit title.

I fixed up the commit title before applying, so those comments are
really for your next contributions! :-)

Thanks again,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
