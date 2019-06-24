From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 06:36:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: fix static build
 with openssl
In-Reply-To: <20190623211622.30227-1-fontaine.fabrice@gmail.com>
References: <20190623211622.30227-1-fontaine.fabrice@gmail.com>
Message-ID: <20190624063602.3fe10368@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 23:16:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/c3f75480cb4b8b042cdf6a34cc5568ea13e51342
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...keLists.txt-use-pkgconfig-to-find-openssl.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/libvncserver/0002-CMakeLists.txt-use-pkgconfig-to-find-openssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
