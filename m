From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 10:09:45 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: unbreak
In-Reply-To: <1386108647-8520-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 3 Dec 2013 23:10:47 +0100")
References: <1386108647-8520-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87bo0xm17q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > tvheadend tries to impersonate an autotools package, when it is not.
 > This breaks the build.

 > tvheadend's ./configure tries to run compiled code.
 > This breaks the build.

 > Switch tvheadend over to using the generic-package infrastructure,
 > and provide carefully-crafted _CMDS for each steps.

 > We still keep a post-install hook to install our "DB" since it is not
 > part of tvheadend, but an addition of our own packaging of tvheadend.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
