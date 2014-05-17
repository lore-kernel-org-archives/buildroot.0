From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 23:36:59 +0200
Subject: [Buildroot] [PATCH 1/8] graph-depends: rename the variable to
	pass the max depth
In-Reply-To: <ac099fb409cf8c37410df8af5af933758fafa368.1400273945.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 16 May 2014 23:05:13 +0200")
References: <cover.1400273945.git.yann.morin.1998@free.fr>
 <ac099fb409cf8c37410df8af5af933758fafa368.1400273945.git.yann.morin.1998@free.fr>
Message-ID: <87d2fcm6is.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > There will soon be new options to the graph-depends script, which we
 > can only sanely pass via environment variables.

 > Currently, we use such an environment variable to pass the maximum depth
 > of the dependency graph; the name of that variable is explicit that it
 > contains just the depth.

 > However, there has been so far no release of Buildroot which would make
 > use of that variable, so no user should have come to rely on it.

 > Rename that variable so it is less specific, and more generic, so it can
 > be used to pass more options to graph-depends.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Samuel Martin <s.martin49@gmail.com>

Committed, thanks. The rest of the series is imho for 2014.08, but this
one makes sense to apply now.

-- 
Bye, Peter Korsgaard
