From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 19:06:25 +0100
Subject: [Buildroot] [PATCH] package/minidlna/S60minidlnad: add
 force-reload to rebuild DB
In-Reply-To: <1440179718-1864-1-git-send-email-benoit@wsystem.com>
References: <1440179718-1864-1-git-send-email-benoit@wsystem.com>
Message-ID: <20151128190625.3fbe0163@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Fri, 21 Aug 2015 19:55:18 +0200, Beno?t Th?baudeau wrote:
> Add a force-reload operation that restarts minidlnad and makes it
> rebuild its database. This is what Debian does, and this is useful when
> media_dir is changed in the configuration file or when inotify can not
> detect changes inside the media directories (e.g. in case of a mount).
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ---
>  package/minidlna/S60minidlnad | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied, thanks. I've mistakenly applied it to master, my intention was
to apply it to next. But now that it is pushed, it is too late. Anyway,
not a big deal, since your patch can hardly introduce a regression.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
