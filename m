From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 14:28:41 +0200
Subject: [Buildroot] [PATCH v8 01/12] e2fsprogs: change upstream URL
 sf.net -> sourceforge.net
In-Reply-To: <20170422115955.22718-2-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-2-arnout@mind.be>
Message-ID: <20170422142841.29299f42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:59:44 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Carlos Santos <casantos@datacom.ind.br>
> 
> sf.net redirects to sourceforge.net, so directly use that as upstream
> URL. Config.in.host already uses that URL.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> [Arnout: remove trailing /]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/e2fsprogs/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
