From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 12:10:08 +0100
Subject: [Buildroot] [PATCH] sunxi-tools: bump version, add hash
In-Reply-To: <1448314590-13613-1-git-send-email-peter@korsgaard.com>
References: <1448314590-13613-1-git-send-email-peter@korsgaard.com>
Message-ID: <20151125121008.4ea677ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 23 Nov 2015 22:36:30 +0100, Peter Korsgaard wrote:
> Upstream has reworked its build system, so it now supports PREFIX and 'make
> install', so use those.
> 
> Notice that the tools have also gained a sunxi- prefix, so use that as well
> when installing the target variant.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/sunxi-tools/sunxi-tools.hash |  2 ++
>  package/sunxi-tools/sunxi-tools.mk   | 17 ++++++++---------
>  2 files changed, 10 insertions(+), 9 deletions(-)
>  create mode 100644 package/sunxi-tools/sunxi-tools.hash

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
