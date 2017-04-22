From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 14:28:47 +0200
Subject: [Buildroot] [PATCH v8 03/12] e2fsprogs: change into menuconfig
In-Reply-To: <20170422115955.22718-4-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-4-arnout@mind.be>
Message-ID: <20170422142847.569967a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:59:46 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Carlos Santos <casantos@datacom.ind.br>
> 
> We decided some time ago that config entries with 5 or more suboptions
> should be turned into a menuconfig. e2fsprogs has many more than that.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
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
