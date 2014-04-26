From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 26 Apr 2014 21:55:35 +0200
Subject: [Buildroot] [PATCH 1/1] qdecoder : new package
In-Reply-To: <1398533305-12899-1-git-send-email-sagaert.johan@skynet.be>
References: <1398533305-12899-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <e2e0f3d0-03f1-41b0-80c5-3169c77c290c@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

Sagaert Johan <sagaert.johan@skynet.be> schreef:
>qDecoder is a powerful CGI library.
>Features:
>   Supports parsing a request encoded by GET/POST method
>   Supports parsing multipart/form-data encoding.(in-memory and direct disk)
>   Supports COOKIE handling.
>   Supports Session management.
>   Supports FastCGI
>
>Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
>---
>v2:	Changed License to BSD-2
>v3: removed QDECODER_CONF_OPT and created makefile.in patch
>
> ...stall-header-and-lib-in-staging-directory.patch | 28 ++++++++++++++++++++++
> package/qdecoder/Config.in                         |  7 ++++++
> package/qdecoder/qdecoder.mk                       | 14 +++++++++++
> 3 files changed, 49 insertions(+)
> create mode 100644 package/qdecoder/0001-install-header-and-lib-in-staging-directory.patch
> create mode 100644 package/qdecoder/Config.in
> create mode 100644 package/qdecoder/qdecoder.mk
>
>diff --git a/package/qdecoder/0001-install-header-and-lib-in-staging-directory.patch b/package/qdecoder/0001-install-header-and-lib-in-staging-directory.patch

Patch filenames should start with the package name, so qdecoder-0001-description.patch

Best regards,
Thomas
