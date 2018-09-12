From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 10:33:22 +0200
Subject: [Buildroot] [PATCH 1/1] feh: libcurl is optional not mandatory
In-Reply-To: <20180911203447.19297-1-fontaine.fabrice@gmail.com>
References: <20180911203447.19297-1-fontaine.fabrice@gmail.com>
Message-ID: <20180912103322.53eba778@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 22:34:47 +0200, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/feh/Config.in |  1 -
>  package/feh/feh.mk    | 14 +++++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
