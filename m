From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 00:22:55 +0200
Subject: [Buildroot] [PATCH 2/3] package/libgc: add Boehm-Demers-Weiser
 gc	library
In-Reply-To: <d8bb9829-7b7b-4114-b950-979ebd55a3d1@email.android.com>
References: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
 <1397225156-23112-3-git-send-email-alex.bennee@linaro.org>
 <d8bb9829-7b7b-4114-b950-979ebd55a3d1@email.android.com>
Message-ID: <20140412002255.770112ba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 11 Apr 2014 22:03:23 +0200, Thomas De Schampheleire wrote:

> >+LIBGC_VERSION = 7.4.0
> >+LIBGC_SOURCE = gc-${LIBGC_VERSION}.tar.gz
> >+LIBGC_SITE = http://www.hboehm.info/gc/gc_source/
> >+LIBGC_DEPENDANCIES += libatomic_ops
> 
> This should be: ..._DEPENDENCIES with E.

And the += is not needed, a simple = is sufficient here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
