From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:47:02 +0100
Subject: [Buildroot] [PATCH 1/3] efivar: fix comment after uClibc
 compatibility patch
In-Reply-To: <1480979238-18273-1-git-send-email-nunes.erico@gmail.com>
References: <1480979238-18273-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161207234702.0e5e8400@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 00:07:15 +0100, Erico Nunes wrote:
> uClibc support was recently added to efivar through a small
> compatibility patch.
> This commit updates a comment in the efivar recipe to reflect this, as
> we no longer have glibc as the only supported C library.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/efivar/efivar.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

All three patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
