From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:22:00 +0200
Subject: [Buildroot] [PATCH v2] gstreamer{,
 1}: fix unaligned access detection for arc
In-Reply-To: <1408547087-31816-1-git-send-email-abrodkin@synopsys.com>
References: <1408547087-31816-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140821152200.21f70c9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 20 Aug 2014 19:04:47 +0400, Alexey Brodkin wrote:
> Fixes the same issue as reported for microblaze here
> http://autobuild.buildroot.net/results/f49/f4914bb3999c8a7a0c0a2afdac5de40fb9058372/
> 
> Similar to the existing handling for avr32, microblaze and xtensa.
> Also add it for gstreamer1 for good measure as it was missing there as well.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
