From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 14:30:36 +0200
Subject: [Buildroot] [PATCH v8 05/12] e2fsprogs: use libblkid and
 libuuid from util-linux for host
In-Reply-To: <20170422115955.22718-6-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-6-arnout@mind.be>
Message-ID: <20170422143036.419ac699@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:59:48 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Carlos Santos <casantos@datacom.ind.br>
> 
> We have a host-util-linux, so we can use it to provide libblkid and
> libuuid. This makes it consistent with the target package.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/e2fsprogs/Config.in.host |  1 +
>  package/e2fsprogs/e2fsprogs.mk   | 13 ++++++++++---
>  2 files changed, 11 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
