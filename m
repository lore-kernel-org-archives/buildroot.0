From: Cristi Magherusan <Cristi.Magherusan@net.utcluj.ro>
Date: Tue, 07 Jul 2009 23:12:00 +0300
Subject: [Buildroot] Buildroot fails to to compile uClibc-NPTL
Message-ID: <1246997520.32432.396.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried to get the NPTL branch to build in buildroot, but it fails due
to some circular symbols dependencies, from what I could tell. It fails
both in sh4 and in the experimental x86 port that I'm working on, with
similar errors, caused by the __libc_errno symbol which is missing. They
both build on their own (sh4 needs some minor fixes in order to build).

Is there anyone interested in getting it work, and able to help me on
this issue?

Thanks,
Cristi.

-- 
Ing. Cristi M?gheru?an, System/Network Engineer
Technical University of Cluj-Napoca, Romania
http://cc.utcluj.ro  +40264 401247
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 197 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090707/091d0240/attachment.pgp>
