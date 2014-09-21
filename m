From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:48:50 +0200
Subject: [Buildroot] [PATCH 1/3] ffmpeg: consolidate duplicated config
 options
In-Reply-To: <1410228406-2140-1-git-send-email-danomimanchego123@gmail.com>
References: <1410228406-2140-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140921224850.00cebaae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Mon,  8 Sep 2014 22:06:44 -0400, Danomi Manchego wrote:
> Commit 62ab07ef769bd6504fe1db144aaac3fd45db9dad added a bunch
> of hard-coded options.  Some of these options are then again
> added (or negated) based on kconfig settings.  This patch removes
> the hard coded swscale and postproc settings, as they are enabled
> or disabled later.  It also moves the --disable-pic lower
> as an else clause to the part that adds --enable-pic.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/ffmpeg/ffmpeg.mk |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
