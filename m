From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 22:56:04 +0100
Subject: [Buildroot] [PATCH 2/5] busybox: ensure $(BUSYBOX_BUILD_CONFIG)
	is writable
In-Reply-To: <01fa1f7ad6024207eec43d9840894e602e3b06b4.1390939719.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 28 Jan 2014 21:11:22 +0100")
References: <cover.1390939719.git.yann.morin.1998@free.fr>
 <01fa1f7ad6024207eec43d9840894e602e3b06b4.1390939719.git.yann.morin.1998@free.fr>
Message-ID: <877g9j22kr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Nathan Lynch <ntl@pobox.com>
 > If $(BUSYBOX_CONFIG_FILE) is read-only (eg. because Buildroot's
 > source dir is), the sed fixups to $(BUSYBOX_BUILD_CONFIG) fail.

 > Fixes: #4363
 > Signed-off-by: Nathan Lynch <ntl@pobox.com>
 > [yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
