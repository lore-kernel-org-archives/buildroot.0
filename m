From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 21:51:54 +0200
Subject: [Buildroot] [PATCH] libconfuse: bugfix bump to 3.2
In-Reply-To: <20170813202247.17711-1-arnout@mind.be>
References: <20170813202247.17711-1-arnout@mind.be>
Message-ID: <20170814215154.4e58a37e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 22:22:47 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This release contains only two real changes to fix two bugs. One is
> only relevant for Windows; the other one fixes handling of empty
> comment lines.
> 
> libconfuse is used by genimage, and we have one defconfig,
> linksprite_pcduino, that has empty comment lines in its genimage.cfg.
> Thus, it fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/27873642
> 
> While we're at it, also change the upstream URL in Config.in to github.
> The old URL on nongnu was just a download directory and didn't have
> anything newer than 2010, while github has a nice README.md.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Just to be clear, this is for master.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
