From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 3 Mar 2011 04:40:43 -0500
Subject: [Buildroot] __USE_GNU ?
In-Reply-To: <201103031019.44511.dargaud@lpsc.in2p3.fr>
References: <201103031019.44511.dargaud@lpsc.in2p3.fr>
Message-ID: <201103030440.44857.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, March 03, 2011 04:19:44 Guillaume Dargaud wrote:
> A quick googling tell me it's an internal macro to uclibc, so why is it not
> on ? How do I get those two macros ?

you need to define _GNU_SOURCE before including any C library header files.  
this is by design, and is not specific to uClibc.  please read the  
feature_test_macros(7) man page.

also, this has nothing to do with buildroot.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110303/eb48a8e6/attachment.asc>
