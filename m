From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 22:07:00 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts/graph-depends: use the
 standard python logging module
In-Reply-To: <20180401191449.802-1-peter@korsgaard.com>
References: <20180401191449.802-1-peter@korsgaard.com>
Message-ID: <20180401220700.425f0822@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 21:14:48 +0200, Peter Korsgaard wrote:
> Instead of hardcoded sys.stderr.write() calls.  No functional change, but
> allows us to easily implement a quiet option.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
