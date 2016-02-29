From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:46:37 +0100
Subject: [Buildroot] [PATCH/next 09/31] package/kodi: reorder
 select/depends
In-Reply-To: <1456006176-21308-10-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-10-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229234637.5d0ea0c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:14 +0100, Bernd Kuhls wrote:
> From [1]:
> "Even though the ordering has absolutely no consequences in Kconfig, it
> is not logical (when reading). It is more logical and far easier to
> understand when depends come first, followed by the selects."
> 
> Also, the Config.in example in the manual suggests to use this coding
> style [2].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
> [2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
