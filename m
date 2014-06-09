From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:07:23 +0200
Subject: [Buildroot] [PATCH] lsof: do not remove WIDECHARINCL definition
In-Reply-To: <1399042764-22388-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1399042764-22388-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140609150723.4d0ad996@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Fri,  2 May 2014 16:59:23 +0200, Beno?t Th?baudeau wrote:
> WIDECHARINCL is enabled by HASWIDECHAR, so removing its definition if
> BR2_USE_WCHAR is not set is useless.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
> ---
>  package/lsof/lsof.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
