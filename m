From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:44:39 +0200
Subject: [Buildroot] [PATCH] gqrx: bump to version 2.11.4
In-Reply-To: <20180513103601.16644-1-gwenj@trabucayre.com>
References: <20180513103601.16644-1-gwenj@trabucayre.com>
Message-ID: <20180513224439.21cde004@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 May 2018 12:36:01 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gqrx/0001-fix_compilation_in_gcc-6.patch | 34 ------------------------
>  package/gqrx/gqrx.hash                           |  4 ++-
>  package/gqrx/gqrx.mk                             |  2 +-
>  3 files changed, 4 insertions(+), 36 deletions(-)
>  delete mode 100644 package/gqrx/0001-fix_compilation_in_gcc-6.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
