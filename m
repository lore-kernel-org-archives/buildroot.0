From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:11:17 +0100
Subject: [Buildroot] [PATCH 1/5] package/gpsd: remove duplicate
	dependency
In-Reply-To: <07a14a0db8c7fb6e87dea83670fd7b9d53bb1267.1418572993.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 14 Dec 2014 17:04:36 +0100")
References: <cover.1418572993.git.yann.morin.1998@free.fr>
 <07a14a0db8c7fb6e87dea83670fd7b9d53bb1267.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <87lhm8litm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > No need to duplicate the host-pkgconf dependency on the Qt case, we
 > already depend on it in the general case.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
