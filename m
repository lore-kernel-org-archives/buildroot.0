From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:27:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: security bump to 2.0.23
In-Reply-To: <20201208075404.30032-1-jubalh@iodoru.org>
References: <20201208075404.30032-1-jubalh@iodoru.org>
Message-ID: <20201210222725.543d0aba@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Dec 2020 08:54:04 +0100
Michael Vetter <jubalh@iodoru.org> wrote:

> Changes:
> * Fix CVE-2020-27828, heap-overflow in cp_create() in jpc_enc.c
> 
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/jasper/jasper.hash | 2 +-
>  package/jasper/jasper.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
