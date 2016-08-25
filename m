From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Aug 2016 23:56:09 +0200
Subject: [Buildroot] [PATCH] package/uboot-tols: fix dependency of
	comment about FIT support
In-Reply-To: <1472150751-29450-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 25 Aug 2016 20:45:51 +0200")
References: <1472150751-29450-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d1kwecna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When commit 031130a4 added the dependency on sharedlibs for FIT support
 > in uboot-tools, the dependency of the comment was added exactly as the
 > dependency of the symbol.

 > That means the comment is shown when FIT support is possible, and hidden
 > when it is not, while we want it the other way around...

 > Fix the dependency.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
