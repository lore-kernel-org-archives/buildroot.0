From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:32:38 +0200
Subject: [Buildroot] [PATCHv3 5/5] package/efl: keep X11 input 2.2+
 enabled
In-Reply-To: <20200801142035.4060526-5-romain.naour@gmail.com>
References: <20200801142035.4060526-1-romain.naour@gmail.com>
 <20200801142035.4060526-5-romain.naour@gmail.com>
Message-ID: <20200805153238.6495878a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Aug 2020 16:20:35 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Since efl 1.23, X11 input 2.2+ has been enabled by default [1].
> 
> From [2]:
> "It would be a pretty unusual system to have x and no xinput2.2 support."
> 
> While at it, enable explicitely X11 input 2 (enabled by default).
> 
> [1] https://git.enlightenment.org/core/efl.git/commit/?id=cf005ac54abdea843e5731765e41e5088275249f
> [2] https://sourceforge.net/p/enlightenment/mailman/message/37065780/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/efl.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
