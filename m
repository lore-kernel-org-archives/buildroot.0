From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Mar 2018 21:25:35 +0100
Subject: [Buildroot] [PATCH 1/1] Fix fbgrab pixel format report
In-Reply-To: <1520431971-767-1-git-send-email-timo.ketola@exertus.fi>
References: <1520431971-767-1-git-send-email-timo.ketola@exertus.fi>
Message-ID: <20180307212535.3de7f012@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Mar 2018 16:12:51 +0200, Timo Ketola wrote:
> When verbosive, fbgrab reports pixel format. Green and blue offset and
> msb_right fields are accidentally swapped there. This commit adds a patch
> which straightens them up.
> 
> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

Thanks for this patch. One minor nit, we like the commit titles to
always follow the format:

	<package>: <description>

So perhaps here:

	fbgrab: add patch fixing pixel format report

No need to resend just for that, we can fixup when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
