From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 22:57:57 +0100
Subject: [Buildroot] [PATCH 4/5] package/uClibc: ensure .config is
	writable
In-Reply-To: <8f48288b7f047ed79a4b91c20e38f10d08bc2f82.1390939719.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 28 Jan 2014 21:11:24 +0100")
References: <cover.1390939719.git.yann.morin.1998@free.fr>
 <8f48288b7f047ed79a4b91c20e38f10d08bc2f82.1390939719.git.yann.morin.1998@free.fr>
Message-ID: <87y51zzs4a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > If $(UCLIBC_CONFIG_FILE) is read-only (eg. because Buildroot's
 > source dir is), the sed fixups to .config fail.

 > Signed-off-by: Nathan Lynch <ntl@pobox.com>
 > [yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
