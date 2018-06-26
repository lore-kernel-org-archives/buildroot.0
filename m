From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 21:44:53 +0200
Subject: [Buildroot] [PATCH] libostree: bump to version 2018.6
In-Reply-To: <20180626090941.4570-1-marcus.folkesson@gmail.com>
References: <20180626090941.4570-1-marcus.folkesson@gmail.com>
Message-ID: <20180626214453.32224465@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jun 2018 11:09:41 +0200, Marcus Folkesson wrote:
> Also, add upstream patch for not fail builds on 32bit architectures.
> The patch will be removed when bumping to v2018.7.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  ...-repo-Fix-32-bit-format-string-error.patch | 34 +++++++++++++++++++
>  package/libostree/libostree.hash              |  2 +-
>  package/libostree/libostree.mk                |  2 +-
>  3 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 package/libostree/0001-lib-repo-Fix-32-bit-format-string-error.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
