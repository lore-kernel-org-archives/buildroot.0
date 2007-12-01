From: <bogus@does.not.exist.com>
Date: Sat, 01 Dec 2007 07:52:20 -0000
Subject: No subject
Message-ID: <mailman.3.1201214335.4400.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

native gcc (not the cross-compiler), which is using headers from
/usr. That looks like a bug, either in the configure script or in the
relevant .mk files for programs that use OpenSSL.

I've got OpenSSL enabled with python linking against it and no such
issues.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
