From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2016 00:05:33 +0100
Subject: [Buildroot] [PATCH] nodejs: security bump 0.10.x series to
 0.10.48
In-Reply-To: <20161202201652.17515-1-peter@korsgaard.com>
References: <20161202201652.17515-1-peter@korsgaard.com>
Message-ID: <20161203000533.53306d73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Dec 2016 21:16:52 +0100, Peter Korsgaard wrote:
> c-ares: fix for single-byte buffer overwrite, CVE-2016-5180, more
> information at https://c-ares.haxx.se/adv_20160929.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../{0.10.47 => 0.10.48}/0001-remove-python-bz2-dependency.patch      | 0
>  .../{0.10.47 => 0.10.48}/0002-gyp-force-link-command-to-use-CXX.patch | 0
>  .../{0.10.47 => 0.10.48}/0003-fix-musl-USE-MISC-build-issue.patch     | 0
>  .../nodejs/{0.10.47 => 0.10.48}/0004-Fix-support-for-uClibc-ng.patch  | 0
>  package/nodejs/Config.in                                              | 2 +-
>  package/nodejs/nodejs.hash                                            | 4 ++--
>  6 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/nodejs/{0.10.47 => 0.10.48}/0001-remove-python-bz2-dependency.patch (100%)
>  rename package/nodejs/{0.10.47 => 0.10.48}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{0.10.47 => 0.10.48}/0003-fix-musl-USE-MISC-build-issue.patch (100%)
>  rename package/nodejs/{0.10.47 => 0.10.48}/0004-Fix-support-for-uClibc-ng.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
