From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:12:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: drop gdlib-config
In-Reply-To: <20200731080715.150745-1-fontaine.fabrice@gmail.com>
References: <20200731080715.150745-1-fontaine.fabrice@gmail.com>
Message-ID: <20200805231224.56339b9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 10:07:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop gdlib-config and use pkg-config to find gd.
> Indeed, gdlib.pc is available since version 2.1.0 and
> https://github.com/libgd/libgd/commit/071a2a94ee9f9e5ce00ff689dfe67a0fcb885ad6
> and gdlib-config has been dropped from version 2.3.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch  | 9 ++++++---
>  package/nginx/nginx.mk                                   | 1 -
>  2 files changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
