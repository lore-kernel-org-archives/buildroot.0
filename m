From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:15:38 +0100
Subject: [Buildroot] [PATCH v3] exfat,
 exfat-utils: fix the installation path of the helper, utilities
In-Reply-To: <ffca193d-4266-0806-c766-930ab8330977@grandegger.com>
References: <ffca193d-4266-0806-c766-930ab8330977@grandegger.com>
Message-ID: <20191027141538.1390a13b@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Sep 2019 14:29:20 +0200
Wolfgang Grandegger <wg@grandegger.com> wrote:

> "mount" from the "util-linux" package does expect the helper utilities
> in "/sbin" and not "/usr/sbin". We use "--exec-prefix=/" to fix the
> issue. The man-pages are then still installed under "/usr/share/man".
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
