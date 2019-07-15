From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 15 Jul 2019 17:27:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/tesseract-ocr: fix license
In-Reply-To: <20190714225819.4551-1-fontaine.fabrice@gmail.com>
References: <20190714225819.4551-1-fontaine.fabrice@gmail.com>
Message-ID: <CAKcgs2yUr6X0rvEcxVXQ42WruJ-RWE0asF9sc-h=+YT27CcJOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 15 juil. 2019 ? 00:58, Fabrice Fontaine
<fontaine.fabrice@gmail.com> a ?crit :
>
> COPYING has been removed since version 4.1.0 and
> https://github.com/tesseract-ocr/tesseract/commit/618489290536282a59ed7a71381ca083d9a7586a
>
> So replace COPYING by LICENSE
>
> Fixes:
>  - http://autobuild.buildroot.org/results/a3cff9747be539bdaffde3926f995467f33428c0
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tesseract-ocr/tesseract-ocr.hash | 2 +-
>  package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
> index 8de25e2941..a5601adfc7 100644
> --- a/package/tesseract-ocr/tesseract-ocr.hash
> +++ b/package/tesseract-ocr/tesseract-ocr.hash
> @@ -1,6 +1,6 @@
>  # locally computed
>  sha256  5c5ed5f1a76888dc57a83704f24ae02f8319849f5c4cf19d254296978a1a1961  tesseract-ocr-4.1.0.tar.gz
> -sha256  d770c1ac1235bc018530701da1ce453367f7952a3075d12b9029f81a26c05f13  COPYING
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>  sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
>  sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
>  sha256  896b3b4956503ab9daa10285db330881b2d74b70d889b79262cc534b9ec699a4  deu.traineddata
> diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
> index 2cc04596aa..0fbbb93422 100644
> --- a/package/tesseract-ocr/tesseract-ocr.mk
> +++ b/package/tesseract-ocr/tesseract-ocr.mk
> @@ -8,7 +8,7 @@ TESSERACT_OCR_VERSION = 4.1.0
>  TESSERACT_OCR_DATA_VERSION = 4.0.0
>  TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
>  TESSERACT_OCR_LICENSE = Apache-2.0
> -TESSERACT_OCR_LICENSE_FILES = COPYING
> +TESSERACT_OCR_LICENSE_FILES = LICENSE
>
>  # Source from github, no configure script provided
>  TESSERACT_OCR_AUTORECONF = YES
> --
> 2.20.1
>
Acked-by: Gilles Talis <gilles.talis@gmail.com>
