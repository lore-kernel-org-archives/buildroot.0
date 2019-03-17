From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 11:14:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: bump to version
 1.16.2
In-Reply-To: <20190316114943.14110-1-fontaine.fabrice@gmail.com>
References: <20190316114943.14110-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317111424.2a66d695@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Mar 2019 12:49:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update patches and send them upstream
> - Update license hash (typos fixed and year updated)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Don-t-use-fenv.h-on-uClibc.patch          | 30 +++++++++++++
>  package/python-numpy/0001-no-fenv-on-uclibc.patch  | 49 ----------------------
>  ...2-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch | 31 ++++++++++++++
>  .../0003-no-FPU-exceptions-bits-on-ARC-glibc.patch | 42 -------------------
>  package/python-numpy/python-numpy.hash             |  6 +--
>  package/python-numpy/python-numpy.mk               |  2 +-
>  6 files changed, 65 insertions(+), 95 deletions(-)
>  create mode 100644 package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch
>  delete mode 100644 package/python-numpy/0001-no-fenv-on-uclibc.patch
>  create mode 100644 package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch
>  delete mode 100644 package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
