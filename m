From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 23:00:49 +0200
Subject: [Buildroot] [PATCH v4] package/lapack: new package
In-Reply-To: <20160705215717.6417-1-s.martin49@gmail.com>
References: <20160705215717.6417-1-s.martin49@gmail.com>
Message-ID: <20160706230049.4ef4eccc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 23:57:17 +0200, Samuel Martin wrote:
> From: Benjamin Kamath <kamath.ben@gmail.com>
> 
> lapack is a fortran-based linear algebra math library.
> 
> Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>
> [Samuel:
>  - Update to use BR2_TOOLCHAIN_HAS_FORTRAN symbol + add comment
>    when the toolchain does not meet the requirements.
>  - Update powerpc/uclibc dependencies to allow build with musl.
>  - Bump to 3.6.1.]
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
