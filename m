From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:22:30 +0100
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.31.1
In-Reply-To: <20171231115145.2625-1-casantos@datacom.ind.br>
References: <20171231115145.2625-1-casantos@datacom.ind.br>
Message-ID: <20171231172230.52130ab3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Dec 2017 09:51:45 -0200, Carlos Santos wrote:
> Changes in this version:
> 
> - Small improvement and bug fixes.
> - Install rfkill at /usr/sbin (thus overriding the one eventually
>   installed by BusyBox).
> 
> Drop the md5 patch, already applyed upstream.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  .../0001-md5-declare-byteReverse-as-static.patch   | 44 ----------------------
>  package/util-linux/util-linux.hash                 |  2 +-
>  package/util-linux/util-linux.mk                   |  3 +-
>  3 files changed, 3 insertions(+), 46 deletions(-)
>  delete mode 100644 package/util-linux/0001-md5-declare-byteReverse-as-static.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
