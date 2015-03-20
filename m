From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:04:28 +0100
Subject: [Buildroot] [PATCH] powerpc-utils: security bump to 1.2.24
In-Reply-To: <e946beb5967011b90d37a733a83575de9fdf3607.1426830947.git.baruch@tkos.co.il>
References: <e946beb5967011b90d37a733a83575de9fdf3607.1426830947.git.baruch@tkos.co.il>
Message-ID: <20150320140428.7c0c0bff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 20 Mar 2015 07:55:47 +0200, Baruch Siach wrote:
> Fixes CVE-2014-4040: A local attacker could obtain sensitive information from
> the generated archive such as plain text passwords.
> 
> Yes, version 1.2.24 seems to be newer than 1.4, which is equivalent to 1.2.20.
> 
> Also, switch from git clone to tarball download , and add a .hash file.
> 
> The configure script seems to misdetect stack smashing protection support in
> the toolchain. gcc accepts -fstack_protector_all, but the linker complains:
> "ld: cannot find -lssp".
> 
> Cc: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
