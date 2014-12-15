From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:14:15 +0100
Subject: [Buildroot] [PATCH 2/5] package/ncurses: fix shared-only libs
In-Reply-To: <4568871b23d156c89631a83942d49e0116e9b4ad.1418572993.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 14 Dec 2014 17:04:37 +0100")
References: <cover.1418572993.git.yann.morin.1998@free.fr>
 <4568871b23d156c89631a83942d49e0116e9b4ad.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <87h9wwlioo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > For a shared-only build, do not create the symlinks to the static
 > libraries, sonce they do not exist.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
