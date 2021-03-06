From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:14:12 +0100
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.11
In-Reply-To: <d7b7ea987a3b40c1c7e76728de569e96860c0189.1614861551.git.baruch@tkos.co.il>
References: <d7b7ea987a3b40c1c7e76728de569e96860c0189.1614861551.git.baruch@tkos.co.il>
Message-ID: <20210306231413.421fffb8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Mar 2021 14:39:11 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> Update COPYING: copyright year update, and added note about the bundled
> Linux UAPI headers. Upstream commit 5bd8364f4202d ("Introduce bundled
> directory") says:
> 
>    According to analysis made by Kent Gibson at [1], we are allowed to
>    re-distribute unmodified Linux kernel UAPI headers under the same
>    terms as they are provided by the Linux kernel, and such
>    re-distribution does not affect the license of strace itself.
> 
>    [1] https://lore.kernel.org/linux-gpio/20210128032641.GA11655 at sol/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/strace/strace.hash | 6 +++---
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
