From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 5 May 2008 15:34:48 -0300
Subject: [Buildroot] Ulf, you broke AVR32, why?
Message-ID: <d6cda7730805051134j245a8687o66eaa6fc9d3c93ae@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

r21552 | ulf | 2008-03-29 08:14:27 -0300 (Sat, 29 Mar 2008) | 1 line

Remove AVR32 gdb patches duplicating prepatched source
------------------------------------------------------------------------
r21551 | ulf | 2008-03-29 08:09:49 -0300 (Sat, 29 Mar 2008) | 1 line

Remove binutils AVR32 patches duplicating external source
------------------------------------------------------------------------
r21550 | ulf | 2008-03-29 08:07:12 -0300 (Sat, 29 Mar 2008) | 1 line

Remove avr32 gcc patches duplicating external source
------------------------------------------------------------------------
r21549 | ulf | 2008-03-29 08:04:30 -0300 (Sat, 29 Mar 2008) | 1 line

Remove duplication of AVR32 toolchain


You removed something that was working in favor of something that is
not for no reason.
On top of that, external toolchain tries to download prepatched
toochain from a site that you control, but that has no such files to
download from.
For some Godly unknown reason, there was no commit message on the mailling list.

Please revert your changes asap.

Regards,
   Thiago A. Correa
