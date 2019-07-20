From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 15:39:10 +0200
Subject: [Buildroot] [PATCH] package/tesseract-ocr: fix build on musl
In-Reply-To: <1563556482-2308-1-git-send-email-gilles.talis@gmail.com>
References: <1563556482-2308-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20190720153910.4bbbd02e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Jul 2019 19:14:42 +0200
Gilles Talis <gilles.talis@gmail.com> wrote:

> Fixes autobuild failures like:
> - http://autobuild.buildroot.net/results/e47da689b4a2912b626f5d31086f6414e3e53774/
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  .../0001-Fix-timeval-structure-build-failure.patch | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
