From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 01:33:24 +0200
Subject: [Buildroot] [PATCH] purge-locales: skip /usr/man and
 /usr/share/man
In-Reply-To: <1436821234-31713-1-git-send-email-arnout@mind.be>
References: <1436821234-31713-1-git-send-email-arnout@mind.be>
Message-ID: <20150714013324.2552137e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 13 Jul 2015 23:00:34 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> These directories are going to be removed anyway, so no point purging
> their locales.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
