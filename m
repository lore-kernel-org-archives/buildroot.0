From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 20:44:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/sredird: bump version to 2.2.2,
 add hash
In-Reply-To: <1454263304-17588-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454263304-17588-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131204408.61841b1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 19:01:43 +0100, Bernd Kuhls wrote:
> While Debian still uses version 2.2.1 the bump to 2.2.2 was committed to
> FreeBSD ports back in 2005:
> https://www.freshports.org/commit.php?category=comms&port=sredird&files=yes&message_id=200512291935.jBTJZfff072190 at repoman.freebsd.org
> 
> FreeBSD ports lists the new upstream URL as no. 12:
> https://www.freshports.org/comms/sredird/
> and http://freecode.com/projects/sredird also links to it.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sredird/Config.in    | 2 ++
>  package/sredird/sredird.hash | 2 ++
>  package/sredird/sredird.mk   | 5 ++---
>  3 files changed, 6 insertions(+), 3 deletions(-)
>  create mode 100644 package/sredird/sredird.hash

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
