From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:46:07 +0200
Subject: [Buildroot] [PATCH v2 2/4] infra: add to luarocks support for
 top-level parallel make
In-Reply-To: <1396343572-13551-3-git-send-email-fabio.porcedda@gmail.com>
References: <1396343572-13551-1-git-send-email-fabio.porcedda@gmail.com>
 <1396343572-13551-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140404234607.6af8dff9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue,  1 Apr 2014 11:12:50 +0200, Fabio Porcedda wrote:
> The host-luarock dependency is not always satisfied for the extract
> phase because the %-extract target is not anymore in the dependency
> chain.
> To be sure that the dependency is satisfied add the dependency to the
> stamp file $(%_TARGET_EXTRACT) instead of the %-extract target.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Francois Perrad <fperrad@gmail.com>
> ---
>  package/pkg-luarocks.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
