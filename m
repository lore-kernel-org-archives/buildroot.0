From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 21:55:42 +0100
Subject: [Buildroot] [PATCH v5 4/4] guile: Add new package
In-Reply-To: <1416869790-12988-5-git-send-email-paguilar@paguilar.org>
References: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>
 <1416869790-12988-5-git-send-email-paguilar@paguilar.org>
Message-ID: <20141126215542.433523bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pedro Aguilar,

On Mon, 24 Nov 2014 23:56:30 +0100, Pedro Aguilar wrote:
> Guile is an interpreter and compiler for the Scheme programming
> language, a clean and elegant dialect of Lisp.
> 
> The patch guile-01-fix_arm_endianness.patch is based on guile's
> git commit ^ffd3e55cfd
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Applied to next, with a few changes:

    [Thomas:
     - rewrap comments and help text.
     - add missing host-gettext dependency, since gettext.m4 is needed for
       the package to autoreconf.
     - add missing host-pkgconf dependency.
     - add dependency on wchar, inherited from libunistring.]

Don't hesitate to test the next branch, and verify that guile is
building fine for you.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
