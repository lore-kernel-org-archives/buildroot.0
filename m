From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:14:54 +0100
Subject: [Buildroot] [PATCH 3/5] package/ncurses: slight code
	re-arrangement
In-Reply-To: <7477c81ac14541b175b2d42b2cc94fbc80ca8ed0.1418572993.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 14 Dec 2014 17:04:38 +0100")
References: <cover.1418572993.git.yann.morin.1998@free.fr>
 <7477c81ac14541b175b2d42b2cc94fbc80ca8ed0.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <87d27klinl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Move the definition of libraries to install before it is actually used.
 > Also, in a coming changeset, it will also be used to know which
 > pkg-config files to symlink.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
