From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2015 11:54:19 +0200
Subject: [Buildroot] [PATCH] perl-cross: bump to version 0.9.7
In-Reply-To: <CAB0FRst5vQG3G2+6n5Hc3nyCF+vWdqvcFYtEmf29U9TVzHPcew@mail.gmail.com>
References: <1435561397-27221-1-git-send-email-francois.perrad@gadz.org>
 <20150629220128.2cdc5b25@free-electrons.com>
 <CAB0FRst5vQG3G2+6n5Hc3nyCF+vWdqvcFYtEmf29U9TVzHPcew@mail.gmail.com>
Message-ID: <20150701115419.4734e37c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Jun 2015 11:57:05 +0200, Fran?ois Perrad wrote:

> perl-cross is not a serie of patches which fixes a broken configure script.
> perl-cross is an add-on which adds an alternate configure script for
> cross-compilation.
> Currently, perl-cross is not extracted in the host-perl build tree,
> because it is useless.
> But if perl-cross is extracted, the original configure script works
> fine for building a host-perl.

Ok, good.

> Another point for perl, could you take to look to
> http://patchwork.ozlabs.org/patch/477361/ ?

Applied, thanks for the reminder.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
