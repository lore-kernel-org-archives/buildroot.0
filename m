From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:51:37 +0200
Subject: [Buildroot] [PATCH 1/1] log4cpp: new package
In-Reply-To: <1465393621-21251-1-git-send-email-damien@kal-host.com>
References: <1465393621-21251-1-git-send-email-damien@kal-host.com>
Message-ID: <20160611155137.723310d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Jun 2016 15:47:01 +0200, Damien Lanson wrote:
> Signed-off-by: Damien Lanson <damien@kal-host.com>

Thanks for your contribution! I've applied, after doing the following
changes:

    [Thomas:
     - Rewrap Config.in help text.
     - Add missing new line at the end of the Config.in help text.
     - Use 80 # signs for the .mk file header.
     - Use <pkg>_SUBDIR = log4cpp instead of moving things around during the
       extract step.
     - Fix typo in the license (it's LGPL, not GLPL), and make it LGPLv2.1+,
       since it's what the HTML documentation says.
     - In addition to removing the log4cpp-config script from the target,
       tweak the variant installed in staging so that it behaves properly
       for cross-compilation. Unfortunately, the <pkg>_CONFIG_SCRIPTS
       generic mechanism doesn't work for this config script.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
