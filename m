From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:37:44 +0100
Subject: [Buildroot] [PATCH v1 1/4] package/qt5: enable for nios2
In-Reply-To: <20200310081902.3488-1-ps.report@gmx.net>
References: <20200310081902.3488-1-ps.report@gmx.net>
Message-ID: <20200315233744.06be2dde@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 09:18:59 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> The double-conversion support for nios2 is already enabled
> by commit [1], so drop dependency on !BR2_nios2.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=e2fdb41f711db8894f9c5c83f32250728d4c3aa9
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
