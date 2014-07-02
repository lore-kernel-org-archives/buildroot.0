From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Jul 2014 00:03:40 +0200
Subject: [Buildroot] [PATCH 05/12] pkg-infra: move the wget download
	helper to a script
In-Reply-To: <08a203d2db883eac1f2efe7c7a6b131d4dc883c8.1404335385.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 2 Jul 2014 23:11:23 +0200")
References: <cover.1404335385.git.yann.morin.1998@free.fr>
 <08a203d2db883eac1f2efe7c7a6b131d4dc883c8.1404335385.git.yann.morin.1998@free.fr>
Message-ID: <87lhsba05f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Maintaining the download helpers in the Makefile has proved to be a bit
 > complex, so move it to a shell script.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > Changes v9 -> v10:
 >   - use bash as shell  (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
