From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2020 07:18:05 +0200
Subject: [Buildroot] [PATCH] legacy: drop options removed more than 5
 years ago now
In-Reply-To: <20200621120352.1063-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 21 Jun 2020 14:03:52 +0200")
References: <20200621120352.1063-1-yann.morin.1998@free.fr>
Message-ID: <87mu4v8yr6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  Config.in.legacy     | 1128 ------------------------------------------
 >  boot/uboot/Config.in |    4 -
 >  linux/Config.in      |    4 -
 >  3 files changed, 1136 deletions(-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
