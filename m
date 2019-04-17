From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 21:07:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/sane-backends: remove unneeded
 first patch
In-Reply-To: <20190416172245.18739-1-fontaine.fabrice@gmail.com>
References: <20190416172245.18739-1-fontaine.fabrice@gmail.com>
Message-ID: <20190417210715.71c89214@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Apr 2019 19:22:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This patch is not needed since version 1.0.25 and
> https://gitlab.com/sane-project/backends/commit/8434ea91623f313eeb68ac301f7c7abf65976fc8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sane-backends/0001-qcam-x86.patch     | 61 -------------------
>  ...1-sane_backend-add-missing-config.h.patch} |  0
>  2 files changed, 61 deletions(-)
>  delete mode 100644 package/sane-backends/0001-qcam-x86.patch
>  rename package/sane-backends/{0002-sane_backend-add-missing-config.h.patch => 0001-sane_backend-add-missing-config.h.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
