From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 19:14:44 +0200
Subject: [Buildroot] [PATCH] package/python-numpy: add missing
 sublibrary license
In-Reply-To: <20190409204630.52594-1-giulio.benetti@micronovasrl.com>
References: <20190409204630.52594-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190411191444.6d3372a6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Apr 2019 22:46:30 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Release 1.16.2 tarball doesn't contain all sublibraries license files
> listed in the base LICENSE.txt file.
> This makes python-numpy-legal-info incomplete.
> 
> - Add patch to add missing sublibrary license file:
>   numpy/linalg/lapack_lite/LICENSE.txt
> - its sha256 into hash file.
> - update PYTHON_NUMPY_LICENSE adding:
>   BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  ...03-Add-sublibraries-missing-licenses.patch | 61 +++++++++++++++++++
>  package/python-numpy/python-numpy.hash        |  5 ++
>  package/python-numpy/python-numpy.mk          |  8 ++-
>  3 files changed, 72 insertions(+), 2 deletions(-)
>  create mode 100644 package/python-numpy/0003-Add-sublibraries-missing-licenses.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
