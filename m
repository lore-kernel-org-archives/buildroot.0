From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 16 May 2015 16:39:32 +0200
Subject: [Buildroot] [git commit] package/tinyxml2: Use
 BUILD_SHARED_LIBS cmake standard
In-Reply-To: <20150516120130.B3255801D6@busybox.osuosl.org>
References: <20150516120130.B3255801D6@busybox.osuosl.org>
Message-ID: <555756A4.1000907@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 16/05/2015 14:00, Thomas Petazzoni a ?crit :
> commit: http://git.buildroot.net/buildroot/commit/?id=22f5be171c6f9bb2611e7b87197e9faeabcaab18
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Backport an upstream patch to fix the static build:
> c8ec6fcab4eb501cc5bd328c19dcbd4b30722d52
> 
> Fixes:
> http://autobuild.buildroot.net/results/e56/e568d81030087f66f8ac4ccd4f496b550930cbae/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch |   65 ++++++++++++++++++++
>  1 files changed, 65 insertions(+), 0 deletions(-)
> 
> diff --git a/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch b/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch

This patch has been corrupted during the upstream process.
It still apply on my local branch but not in master.

It seems that the line ending has been modified.

http://autobuild.buildroot.net/results/b74/b749e7af2ab3e118ec1e0cfaa037e6c030a191cf/build-end.log

Best regards,
Romain
