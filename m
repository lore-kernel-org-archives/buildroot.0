From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 22:47:03 +0100
Subject: [Buildroot] [PATCH] Revert "package/tzdata: install a default
	localtime"
In-Reply-To: <1390944834-23639-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 28 Jan 2014 22:33:54 +0100")
References: <1390944834-23639-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k3dj22zs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > This reverts commit f96e4d7f348ce1b7b53763f102bbedb1ef6a1991.

 > As suggested by Thomas, we need to find a single solution that is
 > valid for both (e)glibc and uClibc.

 > There is work on-going by Alexandre, so just revert this for now.

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
