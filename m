From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:41:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: bump to version
 2.1.4
In-Reply-To: <20200712213543.64986-1-fontaine.fabrice@gmail.com>
References: <20200712213543.64986-1-fontaine.fabrice@gmail.com>
Message-ID: <20200712234147.67d04da8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jul 2020 23:35:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix a build failure with kernel 4.15 thanks to:
> https://github.com/acassen/keepalived/commit/d47ae3b1c853adefb9680ba31cf05c037d844445
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/db7f149f63e9180b22460caa74850673362aa17c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/keepalived/keepalived.hash | 2 +-
>  package/keepalived/keepalived.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
