From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 11:33:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 60.1
In-Reply-To: <20171203194140.8138-1-bernd.kuhls@t-online.de>
References: <20171203194140.8138-1-bernd.kuhls@t-online.de>
Message-ID: <20171204113351.56a1c2f8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Dec 2017 20:41:40 +0100, Bernd Kuhls wrote:
> Removed 0006-i18n-Drop-include-xlocale.h.patch, problem was fixed
> upstream with a different solution:
> http://bugs.icu-project.org/trac/changeset/40603
> 
> Added upstream sha512 hash and license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/icu/0006-i18n-Drop-include-xlocale.h.patch | 39 ----------------------
>  package/icu/icu.hash                               |  7 ++--
>  package/icu/icu.mk                                 |  2 +-
>  3 files changed, 4 insertions(+), 44 deletions(-)
>  delete mode 100644 package/icu/0006-i18n-Drop-include-xlocale.h.patch

Thanks a lot Mario and Bernd for your feedback confirming that ICU 60.1
still works fine with its reverse dependencies.

I've applied the version bump to master, thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
