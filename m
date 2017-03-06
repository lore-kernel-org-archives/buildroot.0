From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 6 Mar 2017 17:49:48 +0100
Subject: [Buildroot] [PATCH v2] configs/telit_evk_pro3: bump barebox to
	2017.01.0
In-Reply-To: <20170306164504.10572-1-fabio.porcedda@gmail.com>
References: <20170306164504.10572-1-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC-zJUYA67znSwmnRE_JpNUdMG4YW_XtZobe-B3cnzu+pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-03-06 17:45 GMT+01:00 Fabio Porcedda <fabio.porcedda@gmail.com>:
> This bump fix the build failure with gcc5 for barebox.
>
> Some changes were made to the first patch to align to the latest
> barebox api.
>
> Also done the following changes:
> - Use "BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES" instead of patching
>   the barebox sources.
> - Use "BR2_GLOBAL_PATCH_DIR" instead of
>   "BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR".

v2:
- Use BR2_GLOBAL_PATCH_DIR
- Use BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
- Merge fifth patch to the first one
- Add my sob line to all patches
- Rename and move all barebox patches

Best regards
-- 
Fabio Porcedda
