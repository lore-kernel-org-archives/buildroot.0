From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Mar 2021 13:39:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: add poppler optional
 dependency
In-Reply-To: <20210330214331.759988-1-fontaine.fabrice@gmail.com>
References: <20210330214331.759988-1-fontaine.fabrice@gmail.com>
Message-ID: <20210331133926.1ae45938@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Mar 2021 23:43:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> poppler is an optional dependency which is enabled by default since
> version 8.3.0 and
> https://github.com/libvips/libvips/commit/8da4e706dd60aba1a69e49bd562d8de225d2404d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvips/libvips.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
