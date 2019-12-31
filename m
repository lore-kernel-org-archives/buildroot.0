From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 15:28:13 +0100
Subject: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 4.1.1
In-Reply-To: <20191231104035.5506-1-gilles.talis@gmail.com>
References: <20191231104035.5506-1-gilles.talis@gmail.com>
Message-ID: <20191231152813.6e8517ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Dec 2019 11:40:35 +0100
Gilles Talis <gilles.talis@gmail.com> wrote:

> Also removed one patch that was merged upstream
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  ...stead-of-off_t-for-result-from-ftell.patch | 26 -------------------
>  package/tesseract-ocr/tesseract-ocr.hash      |  2 +-
>  package/tesseract-ocr/tesseract-ocr.mk        |  2 +-
>  3 files changed, 2 insertions(+), 28 deletions(-)
>  delete mode 100644 package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
