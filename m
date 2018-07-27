From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 11:07:28 +0200
Subject: [Buildroot] [PATCH v1 1/2] dtc: bump version to 1.4.7
In-Reply-To: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
Message-ID: <20180727110728.300c06e2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jul 2018 19:32:17 +0000, Geoff Levand wrote:
> Bump from 1.4.4 to 1.4.7.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/dtc/dtc.hash | 2 +-
>  package/dtc/dtc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This is failing all over the place in the autobuilders:

  http://autobuild.buildroot.net/?reason=%dtc-1.4.7

Could you look into those issues and provide a patch to address them ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
