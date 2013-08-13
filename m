From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 23:42:51 +0200
Subject: [Buildroot] [v3 1/3] lua: remove built dependencies
In-Reply-To: <1362640642-9951-1-git-send-email-francois.perrad@gadz.org>
References: <1362640642-9951-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20130813234251.637d2874@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu,  7 Mar 2013 08:17:20 +0100, Francois Perrad wrote:
> runtime dependencies are handled in Config.in
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/cgilua/Config.in     |    1 +
>  package/cgilua/cgilua.mk     |    1 -
>  package/copas/Config.in      |    1 +
>  package/copas/copas.mk       |    1 -
>  package/coxpcall/coxpcall.mk |    1 -
>  package/wsapi/Config.in      |    1 +
>  package/wsapi/wsapi.mk       |    1 -
>  package/xavante/Config.in    |    1 +
>  package/xavante/xavante.mk   |    1 -
>  9 files changed, 4 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
