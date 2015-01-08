From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 23:04:29 +0100
Subject: [Buildroot] [PATCH v2 01/28] checkpolicy: new package
In-Reply-To: <1420650663-49350-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1420650663-49350-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150108230429.05f96e98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Wed,  7 Jan 2015 11:10:36 -0600, Matt Weber wrote:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

Thanks, applied with minor tweaks:

    [Thomas:
     - Indicate in the Config.in help text that this policy compiler is
       SELinux related.
     - Rewrap Config.in help text and remove trailing white space.
     - Add a comment in the .mk file to indicate why we're passing
       DESTDIR= at build time.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
