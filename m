From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 17:03:09 +0100
Subject: [Buildroot] [PATCH 01/21 RFC] package/libecore: do not build
	anything at patch time
In-Reply-To: <5e4ec100e9c6dda1262d9b84cd5a63f75ebc3864.1447713615.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 16 Nov 2015 23:46:56 +0100")
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <5e4ec100e9c6dda1262d9b84cd5a63f75ebc3864.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <87bnasehqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Trying to build anything at patch time will result in a broken
 > legal-info, as the needed host dependencies are not yet built.

 > Make that hook a pre-configure hook rather than a post-extract
 > hook.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
