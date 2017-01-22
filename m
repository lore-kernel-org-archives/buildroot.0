From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:55:54 +1100
Subject: [Buildroot] [PATCH v3 1/2] Revert "util-linux: fix
 ncurses/wchar handling"
In-Reply-To: <1485054942-17504-1-git-send-email-casantos@datacom.ind.br>
References: <1484301833-16403-1-git-send-email-casantos@datacom.ind.br>
 <1485054942-17504-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170122175554.6a734894@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jan 2017 01:15:41 -0200, Carlos Santos wrote:
> This reverts commit 5a18eabdf08564688761a9b2f35892d69d8f9a18.
> 
> It did not take into account all the possible situations. A different fix
> will be provided in a forthcomming patch.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/util-linux/Config.in     |  5 -----
>  package/util-linux/util-linux.mk | 20 ++++++++++----------
>  2 files changed, 10 insertions(+), 15 deletions(-)

Both applied to master. Let's see if it really fixes all the
problems :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
