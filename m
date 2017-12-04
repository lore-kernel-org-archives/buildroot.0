From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 11:28:56 +0100
Subject: [Buildroot] [PATCH] kexec: bump to 2.0.16
In-Reply-To: <20171203223942.6380-1-tony@atomide.com>
References: <20171203223942.6380-1-tony@atomide.com>
Message-ID: <20171204112856.10fbac45@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tony,

Great to see you around here :-)

On Sun,  3 Dec 2017 14:39:42 -0800, Tony Lindgren wrote:
> In 2.0.16 we now have uncompressed kernel size available
> for ARM starting v4.14 and later kernels.
> 
> Let's also remove the extra space after the checksum while at it.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  package/kexec/kexec.hash | 2 +-
>  package/kexec/kexec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
