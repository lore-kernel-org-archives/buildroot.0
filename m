From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 22:03:56 +0100
Subject: [Buildroot] [PATCH] picocom: bump to version 3.0
In-Reply-To: <1a63141e34939dac4fac56fb58ff42110b751ab4.1516108676.git.baruch@tkos.co.il>
References: <1a63141e34939dac4fac56fb58ff42110b751ab4.1516108676.git.baruch@tkos.co.il>
Message-ID: <20180116220356.45497254@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 15:17:56 +0200, Baruch Siach wrote:
> Drop LDFLAGS forcing. Makefile now uses appends to environment LDFLAGS.
> 
> Add license hash.
> 
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/picocom/picocom.hash | 3 ++-
>  package/picocom/picocom.mk   | 5 ++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
