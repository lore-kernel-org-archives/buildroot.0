From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Jul 2014 00:06:51 +0200
Subject: [Buildroot] [PATCH 06/12] pkg-infra: move the bzr download
	helper to a script
In-Reply-To: <d3992a2cbad0cd02447ce1be186540d030a2ac50.1404335385.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 2 Jul 2014 23:11:24 +0200")
References: <cover.1404335385.git.yann.morin.1998@free.fr>
 <d3992a2cbad0cd02447ce1be186540d030a2ac50.1404335385.git.yann.morin.1998@free.fr>
Message-ID: <87ha2za004.fsf@dell.be.48ers.dk>
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
