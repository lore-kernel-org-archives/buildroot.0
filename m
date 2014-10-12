From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 18:52:12 +0200
Subject: [Buildroot] [PATCH 01/30] package/qemu: do not use autotools
	for qemu
In-Reply-To: <f313b2d07f3feda77583a7a4ffa23299cb7b69e9.1412719495.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 8 Oct 2014 00:38:10 +0200")
References: <cover.1412719495.git.yann.morin.1998@free.fr>
 <f313b2d07f3feda77583a7a4ffa23299cb7b69e9.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <87iojput6r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Although QEMU has a ./configure script, it is not an autotools-package,
 > so switch to providing build and install commands, and to using
 > generic-package.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
