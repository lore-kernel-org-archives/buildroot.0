From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 11:50:56 +0200
Subject: [Buildroot] [PATCH] package/wmctrl: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <20180417182208.8404-1-romain.naour@gmail.com>
References: <20180417182208.8404-1-romain.naour@gmail.com>
Message-ID: <20180418115056.377927f0@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 20:22:08 +0200, Romain Naour wrote:
> set x-includes and x-libraries configure option for cross-compiling.
> wmctrl can use poisoned paths if these options are not passed to
> configure script.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7e5/7e5cba8a5650a00e10d1a5528f38cb2bf772aee1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/wmctrl/wmctrl.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
