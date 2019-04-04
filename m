From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 22:54:22 +0200
Subject: [Buildroot] [PATCH] package/tpm2-tools: drop unused dbus /
 libglib2 dependencies
In-Reply-To: <20190404190028.16680-1-peter@korsgaard.com>
References: <20190404190028.16680-1-peter@korsgaard.com>
Message-ID: <20190404225422.11d35d02@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Apr 2019 21:00:28 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> tpm2-tools does not need dbus or libglib2, so remove them and the
> corresponding toolchain dependencies.
> 
> The confusion may have come from the upstream travis configuration, which
> also builds tpm2-abrmd (which uses dbus+libglib2).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/tpm2-tools/Config.in     | 11 ++---------
>  package/tpm2-tools/tpm2-tools.mk |  2 +-
>  2 files changed, 3 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
