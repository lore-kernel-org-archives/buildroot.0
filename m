From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jul 2014 23:50:28 +0200
Subject: [Buildroot] [PATCH 4/4] package/ca-certificates: add tarball's
	hashes
In-Reply-To: <00582a8025a651a3aefbf46849f1dd36fd1cb940.1404416102.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 3 Jul 2014 21:36:23 +0200")
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <00582a8025a651a3aefbf46849f1dd36fd1cb940.1404416102.git.yann.morin.1998@free.fr>
Message-ID: <8761jc4wuz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > ca-certificates contains sensitive security-related information,
 > and we want to ensure the archive that we download has not been
 > compromised.

 > Add the sha1 and sha256 hashes from Debian's packaging.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Martin Bark <martin@barkynet.com>
 > Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
