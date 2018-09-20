From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 22:28:28 +0200
Subject: [Buildroot] [PATCH 05/14] boot/xloader: URL update
In-Reply-To: <1537449899-9576-5-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-5-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180920222828.720c3126@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 08:24:50 -0500, Matt Weber wrote:
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  boot/xloader/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

I've fixed the commit title: you're adding an upstream URL, not
updating it, and I've applied.

However:
 
 - The link isn't really a useful upstream URL. There in fact doesn't
   seem to be any page that is really relevant for X-Loader.

 - I am not sure having a package for xloader still makes sense. It's
   completely deprecated now that U-Boot has SPL support for TI
   platforms. Perhaps we should simply remove it ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
