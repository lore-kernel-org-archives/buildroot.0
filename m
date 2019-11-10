From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Nov 2019 15:37:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/jailhouse: python scripts needs
 python-mako
In-Reply-To: <20191109213352.13020-1-fontaine.fabrice@gmail.com>
References: <20191109213352.13020-1-fontaine.fabrice@gmail.com>
Message-ID: <20191110153725.2c2ae113@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Nov 2019 22:33:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> jailhouse-config-create script needs python-mako, see
> https://github.com/siemens/jailhouse/commit/5c7f2c4c30f19aa7eb95dffa7b7bb92393c09ba7
> 
> Moreover jailhouse-config-create needs host-python-mako to build
> jailhouse-config-collect
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jailhouse/Config.in    |  1 +
>  package/jailhouse/jailhouse.mk | 12 +++++++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
