From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 15:59:19 +0100
Subject: [Buildroot] [PATCH] coreutils: expand list of files moved from
 /usr/bin to /bin
In-Reply-To: <20171012233332.30550-1-casantos@datacom.ind.br>
References: <20171012233332.30550-1-casantos@datacom.ind.br>
Message-ID: <20180101155919.050a470c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Oct 2017 20:33:32 -0300, Carlos Santos wrote:
> BusyBox installs kill, link, mktemp, nice and printenv on /bin, so
> ensure that coreutils replaces them.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/coreutils/coreutils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
