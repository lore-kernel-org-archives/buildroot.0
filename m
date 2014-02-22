From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 21:46:07 +0100
Subject: [Buildroot] [PATCH 3/3] manual: add explanations on limitations
	about using O=...
In-Reply-To: <9eb719929c8f1740b880ad177c7dec7aaa29ede4.1393020340.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 21 Feb 2014 23:17:54 +0100")
References: <cover.1393020340.git.yann.morin.1998@free.fr>
 <9eb719929c8f1740b880ad177c7dec7aaa29ede4.1393020340.git.yann.morin.1998@free.fr>
Message-ID: <87lhx2swog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Using a relative path for O=... has limitations, since it is interpreted
 > relative to the Buildroot tree, and thus may lead to unexpected results.

 > For example, running this:
 >     make -C buildroot O=my-O

 > will not create my-O in the current working directory, but as a
 > sub-directory of the Buildroot tree, here in buildroot/my-O

 > Explain this in the manual (as is similarly done for BR2_EXTERNAL).
 > Also add a note that $(O) will be created if missing.

 > Also change O=.. and -C .. to O=<...> and -C <...> to make it explicit
 > this is an ellipse, not a relative path.

 > Reported-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
