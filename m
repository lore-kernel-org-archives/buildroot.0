From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 22:58:05 +0200
Subject: [Buildroot] [PATCH 1/3] package/pmake: force argv[0]=${0} in
	the pmake wrapper
In-Reply-To: <6c151d23c349f63fed35cf97396e8ed7123ac303.1368567696.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 14 May 2013 23:45:57 +0200")
References: <cover.1368567696.git.yann.morin.1998@free.fr>
 <cover.1368567696.git.yann.morin.1998@free.fr>
 <6c151d23c349f63fed35cf97396e8ed7123ac303.1368567696.git.yann.morin.1998@free.fr>
Message-ID: <87mwrcxk0y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> This forces bmake to call the wrapper, not itself.
 Yann> Also, use consistent "${0/*}" instead of "${0/pmake}".

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
