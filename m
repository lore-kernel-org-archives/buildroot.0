From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Aug 2010 20:07:09 +0200
Subject: [Buildroot] libssp missing from target
In-Reply-To: <i5j4vi$oj9$1@dough.gmane.org>
References: <i5j4vi$oj9$1@dough.gmane.org>
Message-ID: <20100831200709.11d5a800@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Aug 2010 14:52:34 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I just added a package (systemtap) that uses libssp.  I find libssp.so
> et al. are present in output/staging/lib but missing from
> output/target/lib. Is there something I need to do in my package
> makefile to tell buildroot that my package needs libssp to be copied
> from staging into target?

What is libssp ? Who needs it (besides systemtap) and for what ?

It seems to exist in uClibc toolchains, but not in glibc toolchains.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
