From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:45:51 +0100
Subject: [Buildroot] [PATCH 0/7 v7] package/fftw: add a bunch of
 optimisations (branch yem/fftw)
In-Reply-To: <cover.1426523417.git.yann.morin.1998@free.fr>
References: <cover.1426523417.git.yann.morin.1998@free.fr>
Message-ID: <20150316194551.32d2d4a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 16 Mar 2015 17:31:20 +0100, Yann E. MORIN wrote:

> Gwenhael Goavec-Merou (1):
>       fftw: add compile precision option
> 
> Yann E. MORIN (6):
>       package/fftw: add option for fast maths
>       package/fftw: add x86 optimisations
>       package/fftw: add ARM optimisations
>       package/fftw: disable fortran
>       package/fftw: enable threads when the toolchain has them
>       package/fftw: enable OpenMP if the compiler has that

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
