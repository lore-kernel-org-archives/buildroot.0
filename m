From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:19:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsvgtiny: fix build with
 latest gperf
In-Reply-To: <20191014203306.30263-1-fontaine.fabrice@gmail.com>
References: <20191014203306.30263-1-fontaine.fabrice@gmail.com>
Message-ID: <20191015091900.16fb1411@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 22:33:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove second patch and retrieve two upstream patches to fix build with
> latest gperf
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/51be63089209d38c2cf29b0e0b08f73a0e15c467
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Werror.patch => 0002-Remove-Werror.patch} |  0
>  package/libsvgtiny/0002-create-builddir.patch | 15 ---
>  ...-inlines-and-non-inlines-calling-one.patch | 36 +++++++
>  ...nclude-gperf-generated-code-directly.patch | 97 +++++++++++++++++++
>  4 files changed, 133 insertions(+), 15 deletions(-)
>  rename package/libsvgtiny/{0003-Remove-Werror.patch => 0002-Remove-Werror.patch} (100%)
>  delete mode 100644 package/libsvgtiny/0002-create-builddir.patch
>  create mode 100644 package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
>  create mode 100644 package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
