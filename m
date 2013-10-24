From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Oct 2013 08:47:49 +0200
Subject: [Buildroot] [PATCH] Makefile: export BUILD_DIR
In-Reply-To: <1382566309-11943-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 23 Oct 2013 23:11:49 +0100")
References: <1382566309-11943-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87li1j88ru.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > $(BUILD_DIR) is a nice place to put files generated during the build.
 > With the advent of user-supplied step-hooks, they may want to store
 > some information on the build.

 > Export BUILD_DIR to that effect; update manual accordingly.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > v2: update documentation (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
