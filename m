From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 15:18:41 +0200
Subject: [Buildroot] [PATCH] package/copas: avoid to load module
 coxpocall with LuaJIT
In-Reply-To: <20190407085907.19186-1-francois.perrad@gadz.org>
References: <20190407085907.19186-1-francois.perrad@gadz.org>
Message-ID: <20190407151841.31547006@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Apr 2019 10:59:07 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...0001-Do-not-load-coxpcall-for-LuaJIT.patch | 49 +++++++++++++++++++
>  package/copas/Config.in                       |  2 +-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
