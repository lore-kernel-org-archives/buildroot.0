From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Jul 2011 16:10:52 +0200
Subject: [Buildroot] Download external toolchain with make source
In-Reply-To: <CA+Xn3W1gTygZ03eu15dafntc2Nynn6X=cNgzKsW2RmRh9oPh2A@mail.gmail.com>
 (Herve Fache's message of "Fri, 8 Jul 2011 14:45:26 +0200")
References: <CA+Xn3W1gTygZ03eu15dafntc2Nynn6X=cNgzKsW2RmRh9oPh2A@mail.gmail.com>
Message-ID: <87ei20yiab.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Herve" == Fache, Herve <h-fache@ti.com> writes:

 Herve> Hello list,
 Herve> We have a need for an external toolchain, and need to be able to
 Herve> download everything for off-line compilation. To reach this goal, we
 Herve> have added the option for make source to download the external
 Herve> toolchain together with the packages.

 Herve> I thought you may be interested in this very simple patch to support
 Herve> this feature :-)

Thanks. I would prefer to use (ab)use the uclibc-source target, similar
to how we ensure the external toolchain gets setup before building
packages.

I also just noticed crosstool-ng needs it as well.

I'll fix it up and commit.

-- 
Bye, Peter Korsgaard
