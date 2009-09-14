From: Joe tech <joetech20@gmail.com>
Date: Mon, 14 Sep 2009 18:44:55 +0530
Subject: [Buildroot] Enabling oprofiler package on buildroot-2009.08 (MIPS
	cross-compilation)
Message-ID: <4345ac050909140614i387f8705yaec4c1c52f8152c2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have downloaded the latest buildroot (version 2009.08) and have
crosscompiled it for Mips32 arch. I am using the latest packages, gcc 4.3.3,
binutils 2.19.1, uClibc-0.9.30.1 &  busybox-1.14.3. Now, I am trying to
enable the oprofiler package. But i am not succesful in getting the
oprofiler package compiled. On enabling oprofiler package, i get the error
"libbfd is not supported". I have verified that libbfd.so is not created in
the binutils directory.
Any idea on how to get out of this issue? which is the best way to resolve
this dependency?
I am stuck with this error for quiet sometime and not able to proceed
further. Request some help from any of the users. I suppose, this is the
best mailing list to get support on buildroot related issues. Let me know if
you think there a better forum wherein i can put forward this issue.

Regards,
Joe.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090914/f92607ae/attachment.htm>
