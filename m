From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 19 Sep 2013 09:09:53 +0200
Subject: [Buildroot] [PATCH] qt5: give numbers to patch files
In-Reply-To: <1379573808-9750-1-git-send-email-fatih.asici@gmail.com>
References: <1379573808-9750-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <CAHXCMM+Ln-xFOoKRJaWrNBKM6vqqUTkh17buHh-fnJXweHe82g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/19 Fatih A??c? <fatih.asici@gmail.com>

> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>

---
>  ...se-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch} |
>    0
>  .../{qt5base-mkspecs-files.patch => qt5base-0002-mkspecs-files.patch}  |
>    0
>  .../{qt5base-uclibc-no-lfs.patch => qt5base-0003-uclibc-no-lfs.patch}  |
>    0
>  ...ule.patch => qt5jsbackend-0001-dont-import-bz2-python-module.patch} |
>    0
>  ...t5jsbackend-fix-uclibc.patch => qt5jsbackend-0002-fix-uclibc.patch} |
>    0
>  ...bkit-egl-includepath.patch => qt5webkit-0001-egl-includepath.patch} |
>    0
>  6 files changed, 0 insertions(+), 0 deletions(-)
>  rename
> package/qt5/qt5base/{qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> => qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch}
> (100%)
>  rename package/qt5/qt5base/{qt5base-mkspecs-files.patch =>
> qt5base-0002-mkspecs-files.patch} (100%)
>  rename package/qt5/qt5base/{qt5base-uclibc-no-lfs.patch =>
> qt5base-0003-uclibc-no-lfs.patch} (100%)
>  rename
> package/qt5/qt5jsbackend/{qt5jsbackend-dont-import-bz2-python-module.patch
> => qt5jsbackend-0001-dont-import-bz2-python-module.patch} (100%)
>  rename package/qt5/qt5jsbackend/{qt5jsbackend-fix-uclibc.patch =>
> qt5jsbackend-0002-fix-uclibc.patch} (100%)
>  rename package/qt5/qt5webkit/{qt5webkit-egl-includepath.patch =>
> qt5webkit-0001-egl-includepath.patch} (100%)
>
> diff --git
> a/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> b/package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> similarity index 100%
> rename from
> package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> rename to
> package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch
> b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> similarity index 100%
> rename from package/qt5/qt5base/qt5base-mkspecs-files.patch
> rename to package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> diff --git a/package/qt5/qt5base/qt5base-uclibc-no-lfs.patch
> b/package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch
> similarity index 100%
> rename from package/qt5/qt5base/qt5base-uclibc-no-lfs.patch
> rename to package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch
> diff --git
> a/package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch
> b/package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch
> similarity index 100%
> rename from
> package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch
> rename to
> package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch
> diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
> b/package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
> similarity index 100%
> rename from package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
> rename to package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
> diff --git a/package/qt5/qt5webkit/qt5webkit-egl-includepath.patch
> b/package/qt5/qt5webkit/qt5webkit-0001-egl-includepath.patch
> similarity index 100%
> rename from package/qt5/qt5webkit/qt5webkit-egl-includepath.patch
> rename to package/qt5/qt5webkit/qt5webkit-0001-egl-includepath.patch
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/88d4e9cb/attachment.html>
