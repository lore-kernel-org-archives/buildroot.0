From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 3 Jan 2020 16:51:47 +0100
Subject: [Buildroot] [PATCH 3/5] package/perl-math-bigint: remove it
In-Reply-To: <20191222162146.1947-3-francois.perrad@gadz.org>
References: <20191222162146.1947-1-francois.perrad@gadz.org>
 <20191222162146.1947-3-francois.perrad@gadz.org>
Message-ID: <CAAXf6LUxkaRZD-MXk8i_dDUE_Y3F5+wgFv0ypOhapgqO-H3OoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El dom., 22 dic. 2019 a las 17:22, Francois Perrad
(<fperrad@gmail.com>) escribi?:
>
> Math::BigInt is a Perl core module
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                              |  1 -
>  package/perl-math-bigint/Config.in             |  6 ------
>  package/perl-math-bigint/perl-math-bigint.hash |  6 ------
>  package/perl-math-bigint/perl-math-bigint.mk   | 14 --------------
>  4 files changed, 27 deletions(-)
>  delete mode 100644 package/perl-math-bigint/Config.in
>  delete mode 100644 package/perl-math-bigint/perl-math-bigint.hash
>  delete mode 100644 package/perl-math-bigint/perl-math-bigint.mk

Please note there is also an entry in DEVELOPERS to be removed...

Thanks,
Thomas
