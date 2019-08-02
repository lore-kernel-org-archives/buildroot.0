From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:53:01 +0200
Subject: [Buildroot] [PATCH v2 2/7] package/qemu: enable sparc64 support
 for host-qemu
In-Reply-To: <1557075239-30667-3-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-3-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20190802235301.6a272a2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 May 2019 18:53:54 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> This config enable host eqmu support for sparc64 which
> allows to test this architecture in gitlab.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  package/qemu/Config.in.host | 1 +
>  package/qemu/qemu.mk        | 1 +
>  2 files changed, 2 insertions(+)

Applied to master after tweaking a bit the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
