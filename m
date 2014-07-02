From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Jul 2014 00:07:49 +0200
Subject: [Buildroot] [PATCH 07/12] pkg-infra: move the scp download
	helper to a script
In-Reply-To: <1bf89791a75856e1a6218923df84c5167ee3bcfb.1404335385.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 2 Jul 2014 23:11:25 +0200")
References: <cover.1404335385.git.yann.morin.1998@free.fr>
 <1bf89791a75856e1a6218923df84c5167ee3bcfb.1404335385.git.yann.morin.1998@free.fr>
Message-ID: <87d2dn9zyi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Maintaining the download helpers in the Makefile has proved to be a bit
 > complex, so move it to a shell script.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Changes v9 -> v10:
 >   - use bash as shell  (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
