From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 22:59:27 +0100
Subject: [Buildroot] [PATCH 14/32] qt5base: add eglfs graphics backend
In-Reply-To: <1362687540-19440-15-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:18:42 +0100")
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362687540-19440-15-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87620yx6f4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/qt5/qt5base/Config.in                      |   11 ++++++-
 Thomas>  ...nce-add-egl-to-CONFIG-to-get-correct-incl.patch |   32 ++++++++++++++++++++
 Thomas>  package/qt5/qt5base/qt5base.mk                     |    9 ++++--
 Thomas>  3 files changed, 49 insertions(+), 3 deletions(-)
 Thomas>  create mode 100644 package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch

 Thomas> +++ b/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
 Thomas> @@ -0,0 +1,32 @@
 Thomas> +From 588c60d0c3d11e79d19860fa62b03c935658d13a Mon Sep 17 00:00:00 2001
 Thomas> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> +Date: Sun, 13 Jan 2013 14:36:48 +0100
 Thomas> +Subject: [PATCH qtbase] eglconvenience: add egl to CONFIG to get correct include
 Thomas> + paths
 Thomas> +

It seems this somehow (before adding to buildroot) got wordwrapped?
E.G. 'paths' should normally be part of the subject line.

Other than that it looks good.

-- 
Bye, Peter Korsgaard
