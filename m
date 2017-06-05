From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:53:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 59.1
In-Reply-To: <20170605101452.30313-1-bernd.kuhls@t-online.de>
References: <20170605101452.30313-1-bernd.kuhls@t-online.de>
Message-ID: <20170605155327.2ac1f05e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 12:14:52 +0200, Bernd Kuhls wrote:
> According to the release notes "Compiler support for C++11 is now
> required for building the ICU libraries.
> GCC: version 4.8 and later has been tested."
> 
> Added corresponding dependencies and reverse dependencies.
> Removed patch 0006 applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/beecrypt/Config.in                         |   5 +-
>  package/cppcms/Config.in                           |   5 +
>  ...-utext-problems-with-handling-of-bad-utf8.patch | 173 ---------------------
>  package/icu/Config.in                              |   6 +-
>  package/icu/icu.hash                               |   6 +-
>  package/icu/icu.mk                                 |   2 +-
>  package/python-mwscrape2slob/Config.in             |   6 +-
>  package/python-pyicu/Config.in                     |   6 +-
>  package/python-slob/Config.in                      |   6 +-
>  package/qt5/qt5base/Config.in                      |   5 +
>  package/qt5/qt5webkit/Config.in                    |   5 +-
>  11 files changed, 36 insertions(+), 189 deletions(-)
>  delete mode 100644 package/icu/0006-utext-problems-with-handling-of-bad-utf8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
