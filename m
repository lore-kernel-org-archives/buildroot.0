From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:41:00 +0200
Subject: [Buildroot] [PATCH 12/14] boot/vexpress-firmware: URL update
In-Reply-To: <1537449899-9576-12-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-12-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180920214100.7087bd65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 08:24:57 -0500, Matt Weber wrote:
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  boot/vexpress-firmware/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

The title says "URL update", but that's not true: this commit is adding
the URL. A better commit title:

  boot/vexpress-firmware: add upstream URL in Config.in help text

I fixed that and applied. Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
