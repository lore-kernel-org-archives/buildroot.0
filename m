From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 03:51:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/qpdf: fix build with gcc 4.8
In-Reply-To: <20200217214601.1600353-1-fontaine.fabrice@gmail.com>
References: <20200217214601.1600353-1-fontaine.fabrice@gmail.com>
Message-ID: <20200218035122.5e7a2a1c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:46:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ad7fb68ae87850a85509eed80fd0cae8721b10c5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ests-cxx11.cc-fix-build-with-gcc-4.8.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/qpdf/0001-libtests-cxx11.cc-fix-build-with-gcc-4.8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
