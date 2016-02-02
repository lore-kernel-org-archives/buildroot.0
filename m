From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 22:18:25 +0100
Subject: [Buildroot] [PATCH] yajl: Bump version to 2.1.0
In-Reply-To: <1454431113-32207-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1454431113-32207-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <56B11D21.5020907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-02-16 17:38, Maxime Hadjinlian wrote:
> Remove 0001-math-link.patch as some added code render it useless.
> Rework 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
> because it did not apply anymore.
> This patch is already in a PR upstream.
> 
> Add 0001-cmake-uClibc-Fix-missing-libm-for-tests.patch, to fix a build
> error with uClibc toolchain.
> This has been sent upstream:
> https://github.com/lloyd/yajl/pull/184
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  ...1-cmake-uClibc-Fix-missing-libm-for-tests.patch | 30 +++++++++++++++++
>  package/yajl/0001-math-link.patch                  | 24 -------------
>  ...le-shared-library-build-when-BUILD_SHARED.patch | 39 ++++++++++++----------
>  package/yajl/yajl.hash                             |  2 +-
>  package/yajl/yajl.mk                               |  2 +-
>  5 files changed, 54 insertions(+), 43 deletions(-)
>  create mode 100644 package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch
>  delete mode 100644 package/yajl/0001-math-link.patch
> 
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
