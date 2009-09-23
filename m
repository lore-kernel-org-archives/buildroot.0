From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 08:47:50 +0200
Subject: [Buildroot] [PATCH] Change the default BR2_DL_DIR location
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901D422DD@mi8nycmail19.Mi8.com>
	(H. Hartley Sweeten's message of "Tue\,
	22 Sep 2009 19\:27\:10 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE190901D422DD@mi8nycmail19.Mi8.com>
Message-ID: <873a6etaw9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Change to default Download dir so that different 'make O=<directory>'
 H> commands will use the same location by default without having to
 H> create a symlink in <directory> or having to export BUILDROOT_DL_DIR.

 H> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
