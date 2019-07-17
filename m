From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 09:16:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/tesseract-ocr: fix license
In-Reply-To: <20190714225819.4551-1-fontaine.fabrice@gmail.com>
References: <20190714225819.4551-1-fontaine.fabrice@gmail.com>
Message-ID: <20190717091633.2323fe35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 00:58:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

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

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
