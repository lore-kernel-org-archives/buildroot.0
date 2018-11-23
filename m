From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 21:59:04 +0100
Subject: [Buildroot] [PATCH/next 1/2] keepalived: bump to version 2.0.10
In-Reply-To: <20181121211611.8521-1-fontaine.fabrice@gmail.com>
References: <20181121211611.8521-1-fontaine.fabrice@gmail.com>
Message-ID: <20181123215904.01c62cd8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 22:16:10 +0100, Fabrice Fontaine wrote:
> - This version adds support for ipset version 7, see:
>   https://github.com/acassen/keepalived/commit/b7a98f9265ffb5927c4d54c9a30726c76e65bb52
> - Remove patch and AUTORECONF = YES, an alternative solution has been
>   implemented, see:
>   https://github.com/acassen/keepalived/commit/9bd10d8168b8e3c14bca61e504e64ed8c2b1eb8d
> - Disable hardening option (enabled by default):
>   https://github.com/acassen/keepalived/commit/5a65e1eb552bd973da35d7153b922682360a5ad2
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b730e8b25c1d3343b7a6d73f6d3b82b13692578b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-configure.ac-do-not-force-PIE.patch  | 38 -------------------
>  package/keepalived/keepalived.hash            |  2 +-
>  package/keepalived/keepalived.mk              |  5 +--
>  3 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 package/keepalived/0001-configure.ac-do-not-force-PIE.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
