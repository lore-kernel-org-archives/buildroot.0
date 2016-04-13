From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:49:42 +0200
Subject: [Buildroot] [PATCH 1/2] poco: bump to version 1.7.2
In-Reply-To: <1459888827-20199-1-git-send-email-joerg.krause@embedded.rocks>
References: <1459888827-20199-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160413234942.7b4ecb0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Apr 2016 22:40:26 +0200, J?rg Krause wrote:
> Also:
>  - add a hash file.
>  - replace patch #0002 by passing the DEFAULT_TARGET to poco
>  - remove patch #0003 as it is obsolet since upstream commit
>    010f7a5370be450109f1726e39d5b193e63a6373
>  - remove patch #0004 which is applied upstream
>  - remove patch #0005 which is fixed by upstream different

Thanks a lot for describing precisely why the different patches have
been dropped. Very useful!

> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0002-poco-don-t-build-debug-libraries.patch    | 33 ----------
>  ...nflicting-declaration-with-unbundled-pcre.patch | 56 -----------------
>  package/poco/0004-fix-unbundled-pcre-usage.patch   | 72 ----------------------
>  .../0005-add-missing-LIBPREFIX-definition.patch    | 29 ---------
>  package/poco/poco.hash                             |  2 +
>  package/poco/poco.mk                               | 21 +++++--
>  6 files changed, 18 insertions(+), 195 deletions(-)
>  delete mode 100644 package/poco/0002-poco-don-t-build-debug-libraries.patch
>  delete mode 100644 package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch
>  delete mode 100644 package/poco/0004-fix-unbundled-pcre-usage.patch
>  delete mode 100644 package/poco/0005-add-missing-LIBPREFIX-definition.patch
>  create mode 100644 package/poco/poco.hash

Both patches applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
