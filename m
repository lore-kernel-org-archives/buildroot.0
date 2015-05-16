From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:08:16 +0200
Subject: [Buildroot] [PATCH v2] package/tinyxml2: Use BUILD_SHARED_LIBS
 cmake standard
In-Reply-To: <1431082195-22498-1-git-send-email-romain.naour@openwide.fr>
References: <1431082195-22498-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150516140816.66d0459a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri,  8 May 2015 12:49:54 +0200, Romain Naour wrote:
> Backport an upstream patch to fix the static build:
> c8ec6fcab4eb501cc5bd328c19dcbd4b30722d52
> 
> Fixes:
> http://autobuild.buildroot.net/results/e56/e568d81030087f66f8ac4ccd4f496b550930cbae/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2 add autobuilder link
> ---
>  ...0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
