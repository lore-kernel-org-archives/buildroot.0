From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 23:53:02 +0200
Subject: [Buildroot] [PATCH 02/12] pkg-infra: move the svn download
	helper to a script
In-Reply-To: <5190faeb3a41b1f4e9cdb444dd86e9d09223149c.1404335385.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 2 Jul 2014 23:11:20 +0200")
References: <cover.1404335385.git.yann.morin.1998@free.fr>
 <5190faeb3a41b1f4e9cdb444dd86e9d09223149c.1404335385.git.yann.morin.1998@free.fr>
Message-ID: <87y4wba0n5.fsf@dell.be.48ers.dk>
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


Committed with >/dev/null added to pushd/popd and Ryans' reviewed-by
added, thanks.

-- 
Bye, Peter Korsgaard
