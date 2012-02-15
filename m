From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 15 Feb 2012 19:26:36 +0100
Subject: [Buildroot] Illegal instruction Built bcc
Message-ID: <4F3BF8DC.6080608@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to compile and run :

#include <stdlib.h>

int main(){
	return 0
}

on a Leon3/Sparc+Linux architecture.

When I compile it with the toolchains binaries provided by Gaisler, it
works well (sparc-linux-gcc) it works well
Whereas when I compile it with a toolchain that I have built using the
BCC sources, I get an illegal instruction when trying to run it.


Where does that come from please ?

-- 
Jigar SOLANKI

LaBRI - UMR 5800
Universit? Bordeaux 1
351 Cours de la Lib?ration
F-33405 Talence Cedex
Phone : (+33) 5 4000 24 87
Fax   : (+33) 5 4000 66 69
Web   : http://www.labri.fr/perso/solanki

* Please do not print this e-mail unless it's really necessary *
---


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/d11fff57/attachment.asc>
