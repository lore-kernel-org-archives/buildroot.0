From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:21:31 +0100
Subject: [Buildroot] [PATCH] package/libiscsi: add optional dependency
 to cunit
In-Reply-To: <20181204102500.14168-1-yann.morin.1998@free.fr>
References: <20181204095712.7130-1-yann.morin.1998@free.fr>
 <20181204102500.14168-1-yann.morin.1998@free.fr>
Message-ID: <20181206212131.0e812735@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Dec 2018 11:25:00 +0100, Yann E. MORIN wrote:
> libiscsi uses cunit for its test suite, and autodetexcts its presence.
> 
> Usually, we just try to disable tests altogether, but there is no way to
> do so. So, ensure proper ordering.
> 
> Note: there is an ac_cv_have_cunit variable, but it is not a true
> ac_cv* cache variable, and the value provided on the command line or
> environment is properly ignored.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Note: for the interesting parties, I've sent a bunch of enhacements to
> the configure script upstream:
>     https://github.com/sahlberg/libiscsi/pull/283
> ---
>  package/libiscsi/libiscsi.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
