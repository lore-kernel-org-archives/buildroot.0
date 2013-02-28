From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Feb 2013 12:43:09 -0300
Subject: [Buildroot] Help needed with cross-compiling libotr
In-Reply-To: <CAG2jQ8jiP6g7Fuhy_H3CgocC8CAMbT9ZF1sX22tsdOmyjhgsaQ@mail.gmail.com>
References: <512F71F7.20409@petroprogram.com> <20130228162157.37abbe84@skate>
 <CAG2jQ8jiP6g7Fuhy_H3CgocC8CAMbT9ZF1sX22tsdOmyjhgsaQ@mail.gmail.com>
Message-ID: <512F7B0D.9020304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/28/2013 12:36 PM, Markos Chandras wrote:
> I tend to agree that these kind of packages might be too much for
> buildroot, but keep in mind that Gentoo comes with a rather big uClibc
> rootfs by default [1]
> 
> [1] http://distfiles.gentoo.org/experimental/x86/uclibc/

A craftman would use catalyst to build his own stage(s) with a minimal
custom profile that gets rid of portage (thus ditching toolchain, python
and a ton other bloating things).
You could even use qmerge (portage-utils) to install extras if you
needed so.
Regards.
