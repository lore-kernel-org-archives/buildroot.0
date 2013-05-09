From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 May 2013 23:51:57 +0200
Subject: [Buildroot] gpu-viv-bin-mx6q
In-Reply-To: <35247.217.149.209.147.1368126210.squirrel@webmail.internl.net>
References: <BA6FC03EA0815D428FB8A3C279ED4992074AE1FA@mx.toyon.corp>
 <35247.217.149.209.147.1368126210.squirrel@webmail.internl.net>
Message-ID: <20130509235157.72d87793@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Henk,

On Thu, 9 May 2013 21:03:30 +0200 (CEST), H.Fijnvandraat at inter.nl.net
wrote:

> Until very recent, i used the crosstool-ng external toolchain from within
> buildroot to generate a good compiler,
> but that has been removed very recently :-((, without an immediate
> replacement

You might be making some confusions here regarding the Crosstool-NG
support. What has been marked deprecated (and not removed!) is the
integration of Crosstool-NG with Buildroot, what we call the
"Crosstool-NG backend". This backend allows Buildroot to automatically
call Crosstool-NG to get a toolchain compiled.

The deprecation (and possible future removal) of this backend is
completely unrelated to the external toolchain backend, which will
remain in place, and will continue to allow the usage of Crosstool-NG
toolchains that have been built outside of Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
