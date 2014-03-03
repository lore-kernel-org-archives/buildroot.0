From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 23:40:31 +0100
Subject: [Buildroot] [PATCH 07/11] python-numpy: new package
In-Reply-To: <1392588004-13317-8-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-8-git-send-email-s.martin49@gmail.com>
Message-ID: <20140303234031.0b9848ed@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 16 Feb 2014 23:00:00 +0100, Samuel Martin wrote:

> +if BR2_PACKAGE_PYTHON_NUMPY
> +config BR2_PACKAGE_PYTHON_NUMPY_BLAS_LAPACK_SUPPORT
> +	bool "blas/lapack support"
> +	select BR2_PACKAGE_CLAPACK
> +endif

Any reason why we don't automatically enable blas/lapack support when
available? Also, I'd prefer to have the optional blas/lapack support
available as a separate patch from the package addition itself, so that
python-numpy can be applied independently from blas/lapack.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
