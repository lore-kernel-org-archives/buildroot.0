From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:22:53 +0200
Subject: [Buildroot] [PATCH 1/1] Clean up remaining references to
 $(HOST_DIR)/usr
In-Reply-To: <20180923220459.7756-1-ferdinand@ombud.nl>
References: <20180923220459.7756-1-ferdinand@ombud.nl>
Message-ID: <20180925222253.780da8d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Sep 2018 00:04:59 +0200, Ferdinand van Aartsen wrote:
> Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
> ---
>  package/asterisk/asterisk.mk           | 2 +-
>  package/clang/clang.mk                 | 6 +++---
>  package/libhttpparser/libhttpparser.mk | 2 +-
>  package/libssh2/libssh2.mk             | 2 +-
>  package/prosody/prosody.mk             | 2 +-
>  package/xmlstarlet/xmlstarlet.mk       | 4 ++--
>  6 files changed, 9 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
