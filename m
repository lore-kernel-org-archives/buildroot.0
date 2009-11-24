From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Nov 2009 16:56:22 +0100
Subject: [Buildroot] [PATCH] Add fuse-sshfs package
In-Reply-To: <4B0BFF55.2090805@zacarias.com.ar> (Gustavo Zacarias's message of
	"Tue\, 24 Nov 2009 12\:44\:21 -0300")
References: <1259073650-3843-1-git-send-email-daniel@caiaq.de>
	<4B0BFF55.2090805@zacarias.com.ar>
Message-ID: <87my2bdihl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Daniel Mack wrote:
 >> +SSHFS_DEPENDENCIES = uclibc libglib2

 Gustavo> Hmmm... doesn't it depend on a userland ssh client (like openssh, maybe dropbear) to keep an open connection/pipe?

Indeed, and the uclibc dependency should get dropped (see 422ce6536b6)

-- 
Bye, Peter Korsgaard
