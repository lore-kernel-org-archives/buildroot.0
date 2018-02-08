From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:05:30 +0100
Subject: [Buildroot] [PATCH NEXT] libmbim: bump to version 1.16.0
In-Reply-To: <20180208191447.16711-1-casantos@datacom.ind.br>
References: <20180208191447.16711-1-casantos@datacom.ind.br>
Message-ID: <20180208230530.7665c254@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Feb 2018 17:14:47 -0200, Carlos Santos wrote:
> Drop the patch already applied upstream.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...-prefer-realpath-to-canonicalize_file_nam.patch | 37 ----------------------
>  package/libmbim/libmbim.hash                       |  2 +-
>  package/libmbim/libmbim.mk                         |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/libmbim/0001-mbim-device-prefer-realpath-to-canonicalize_file_nam.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
