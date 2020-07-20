From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 18:42:19 +0200
Subject: [Buildroot] [git commit] package/python-greenlet: really enable
 for i386
In-Reply-To: <20200707204909.E9ED686596@busybox.osuosl.org> (Yann E. MORIN's
 message of "Tue, 7 Jul 2020 22:51:10 +0200")
References: <20200707204909.E9ED686596@busybox.osuosl.org>
Message-ID: <87imeip28k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b29eadf903be27caee24c12755efbc3bd10bd31a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 30f1decec2c (package/python-greenlet: enable only on supported
 > architectures) mis-typed the architecture name fox 286-32: BR2_x86
 > doesn't exist in buildroot; it is BR2_i386.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - just do the s/x86/i386/ fix for easy backport
 >   - x86_64 split off to its own patch
 > ]

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
