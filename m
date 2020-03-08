From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 16:28:39 +0100
Subject: [Buildroot] [PATCH/next 1/6] package/bctoolbox: bump to version
 4.3.1
In-Reply-To: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
Message-ID: <20200308162839.6a8ad1d7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 18:47:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Refresh patch
> - libiconv is needed without locale since version 4.3.0 and
>   https://github.com/BelledonneCommunications/bctoolbox/commit/d5713996c2ae100594ebf319c54d95297b02a2e1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-Fix-Libs.private-flags-for-mbedtls.patch | 44 +++++++------------
>  package/bctoolbox/Config.in                   |  5 +++
>  package/bctoolbox/bctoolbox.hash              |  2 +-
>  package/bctoolbox/bctoolbox.mk                |  7 ++-
>  package/mediastreamer/Config.in               |  4 ++
>  package/ortp/Config.in                        |  4 ++
>  6 files changed, 36 insertions(+), 30 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
