From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:49:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtty: fix static build with
 openssl
In-Reply-To: <20200326202445.58808-1-fontaine.fabrice@gmail.com>
References: <20200326202445.58808-1-fontaine.fabrice@gmail.com>
Message-ID: <20200329214933.24e033f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 21:24:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/6105b69d8598f0033044a26f53a768e2d4b2915e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ts.txt-fix-static-build-with-openssl.patch | 43 +++++++++++++++++++
>  package/rtty/rtty.mk                          |  2 +-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-openssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
