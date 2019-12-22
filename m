From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:37:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/qpdf: bump to version 9.1.0
In-Reply-To: <20191222104929.2197066-1-fontaine.fabrice@gmail.com>
References: <20191222104929.2197066-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222223759.055769dd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 11:49:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add host-pkgconf dependency as it is used since version 9.0.0 and
>   https://github.com/qpdf/qpdf/commit/12400475283f5081ea55f52a764e43f14032f6ba
> - C++11 is mandatory since version 9.1.0 and
>   https://github.com/qpdf/qpdf/commit/653ce3550d18a07194a4c3bb9b4a3d260ed842cd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qpdf/Config.in | 6 ++++--
>  package/qpdf/qpdf.hash | 4 ++--
>  package/qpdf/qpdf.mk   | 4 ++--
>  3 files changed, 8 insertions(+), 6 deletions(-)

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
