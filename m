From: Maxime Ripard <maxime.ripard@anandra.org>
Date: Wed, 6 Jan 2010 19:03:43 +0100
Subject: [Buildroot] tcl build error
Message-ID: <20100106180343.GX15153@anandra.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm having trouble getting tcl building correctly for generic_arm
architecture, and using the buildroot-generated toolchain. With
both of the latest release and the git tree, it cannot build. Here is
the output :

In file included from ./../generic/tclPort.h:27,
                 from ./../generic/tclAlloc.c:29:
./../generic/../unix/tclUnixPort.h:71: error: expected ?=?, ?,?, ?;?,
?asm? or ?__attribute__? before ?Tcl_SeekOffset?
make[1]: *** [tclAlloc.o] Error 1

I've searched the code to find the error, but couldn't find what causes
it.

Looking forward to your help,
-- 
Maxime Ripard
?tudiant ? l'Universit? de Technologie de Belfort - Montb?liard (UTBM)
G?nie Informatique (GI 04)

6bis rue Paul Giroud
90000 Belfort
France

06 85 40 57 32
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 197 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100106/c89d6ff9/attachment.pgp>
