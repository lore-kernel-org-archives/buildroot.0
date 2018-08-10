From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:34:18 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/Makefile.in: Add missing
 options to LDFLAGS for full RELRO build
In-Reply-To: <1531998123-28360-3-git-send-email-stefan.sorensen@spectralink.com>
References: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
 <1531998123-28360-3-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20180810223418.40391519@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 13:02:02 +0200, Stefan S?rensen wrote:
> The options for a full RELRO build should also be added to LDFLAGS.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Same: I have applied this patch, from the series posted by Matt Weber.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
