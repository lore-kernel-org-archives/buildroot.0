From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:45:47 +0200
Subject: [Buildroot] [PATCH] infra: fix "<pkg>-rebuild" when using rsync
 source feature
In-Reply-To: <1404121888-7966-1-git-send-email-fabio.porcedda@gmail.com>
References: <1404121888-7966-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140715224547.1c2d387a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon, 30 Jun 2014 11:51:28 +0200, Fabio Porcedda wrote:
> Because the configure stamp file depends on the rsync stamp file,
> removing it by the "<pkg>-clean-for-rebuild" rule trigger the configure
> step. To avoid triggering the configure step use an order-only dependency.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Reported-by: C?dric Marie <cedric.marie@openmailbox.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
