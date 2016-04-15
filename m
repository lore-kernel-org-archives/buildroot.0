From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:30:43 +0200
Subject: [Buildroot] [git commit] imlib2: security bump to version 1.4.8
In-Reply-To: <20160414205138.B32E38050E@busybox.osuosl.org>
References: <20160414205138.B32E38050E@busybox.osuosl.org>
Message-ID: <20160415093043.42bf368d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Apr 2016 22:51:10 +0200, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=779676f62d56774c6290dabe4a1e3727f1cb834d
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes:
> CVE-2016-3994 - out of bound read in GIF loader
> CVE-2011-5326 - divide by zero on 2x1 ellipse
> 
> Switch to sourceforge hashes.
> And drop all previous patches, they're upstream, yay.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-GIF-loader-Fix-for-libgif-version-5.patch |  43 -----
>  package/imlib2/0001-fix-CVE-2016-3994.patch        |  71 +++++++++
>  .../0002-GIF-loader-Simplify-error-handling.patch  | 175 ---------------------
>  package/imlib2/0002-fix-CVE-2011-5326.patch        | 104 ++++++++++++
>  ...b2-config-delete-old-reference-to-my_libs.patch |  28 ----
>  ...AY_MISSING-redefined-warnings-when-X-is-d.patch |  75 ---------
>  ...o-not-link-with-X-libs-when-X-is-disabled.patch |  29 ----
>  ...006-GIF-loader-Fix-for-libgif-version-5.1.patch |  44 ------
>  .../0007-fix-compilation-issues-with-musl.patch    |  31 ----
>  package/imlib2/imlib2.hash                         |   5 +-
>  package/imlib2/imlib2.mk                           |   2 +-
>  11 files changed, 179 insertions(+), 428 deletions(-)

Applied to master, thanks. I like when so many patches can be
removed :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
