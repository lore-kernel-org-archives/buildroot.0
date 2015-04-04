From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 12:13:57 +0200
Subject: [Buildroot] [PATCH v2 6/8] package/qpdf: New package qpdf 5.1.2
In-Reply-To: <1427058772-1105-7-git-send-email-olivier.schonken@gmail.com>
References: <1427058772-1105-1-git-send-email-olivier.schonken@gmail.com>
 <1427058772-1105-7-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20150404121357.62625084@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sun, 22 Mar 2015 23:12:50 +0200, Olivier Schonken wrote:

> +comment "qpdf requires a toolchain with C++ support enabled"

This should have been:

	qpdf needs a toolchain w/ C++

See the Buildroot manual for details.

> +#############################################################
> +#
> +# qpdf
> +#
> +#############################################################

Silly requirement of Buildroot: 80 # signs for this comment :)

> +QPDF_VERSION = 5.1.2
> +QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
> +QPDF_INSTALL_STAGING = YES
> +QPDF_LICENSE = Artistic License 2.0

Just "Artistic-2.0". We try to use the license codes from
https://spdx.org/licenses/.

Applied with those minor details fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
