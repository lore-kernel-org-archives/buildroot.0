From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:37:46 +0200
Subject: [Buildroot] [PATCH 3/3] ltp-testsuite: make Config.in libc
 comment standard
In-Reply-To: <1475322624-20518-3-git-send-email-nunes.erico@gmail.com>
References: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
 <1475322624-20518-3-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161003233746.0004c961@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Oct 2016 13:50:24 +0200, Erico Nunes wrote:
> ltp-testsuite was the only package to mention "non-musl" while all other
> packages have it as "glibc or uClibc". This change only adjusts it to
> look like all the other packages.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/ltp-testsuite/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
