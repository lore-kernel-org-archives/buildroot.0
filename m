From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:01:29 +0200
Subject: [Buildroot] [PATCH v3 1/2] spidermonkey185: New package.
In-Reply-To: <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
 <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <20161016120129.4c40ec20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Wed,  6 Jul 2016 12:24:08 +0200, Nicolas Cavallari wrote:
> This is the old 1.8.5 branch of spidermonkey, used in Firefox 4.
> It is rather unmaintained, but some software still depend on it,
> such as couchdb.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/Config.in                                  |  1 +
>  ...01-remove-unused-pkgconfg-nspr-dependency.patch | 18 +++++
>  .../0002-make-shlib-synlink-relative.patch         | 21 +++++
>  .../0003-regenerate-configure.patch                | 44 ++++++++++
>  ...val_layout-on-64-bit-big-endian-platforms.patch | 91 +++++++++++++++++++++
>  ...tatic-assert-fix-strict-aliasing-warnings.patch | 94 ++++++++++++++++++++++
>  ...heFlush-support-error-on-exotic-platforms.patch | 34 ++++++++
>  package/spidermonkey185/Config.in                  | 14 ++++
>  package/spidermonkey185/spidermonkey185.hash       |  2 +
>  package/spidermonkey185/spidermonkey185.mk         | 30 +++++++
>  10 files changed, 349 insertions(+)
>  create mode 100644 package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
>  create mode 100644 package/spidermonkey185/0002-make-shlib-synlink-relative.patch
>  create mode 100644 package/spidermonkey185/0003-regenerate-configure.patch
>  create mode 100644 package/spidermonkey185/0004-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
>  create mode 100644 package/spidermonkey185/0005-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch
>  create mode 100644 package/spidermonkey185/0006-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
>  create mode 100644 package/spidermonkey185/Config.in
>  create mode 100644 package/spidermonkey185/spidermonkey185.hash
>  create mode 100644 package/spidermonkey185/spidermonkey185.mk

We have been looking a bit at your patches during the Buildroot meeting
this week-end. For both patches (spidermonkey185 and couchdb) there
have been a number of comments. If you're still interested, could you
address those comments ?

Another thing is that CouchDB 2.0 has now been released (on September
20), so we would preferably have that version packaged, if possible.

We'll mark your patches as Changes Requested in patchwork, so don't
forget to send an updated version, otherwise we will forget about them.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
