From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Feb 2014 22:52:13 +0100
Subject: [Buildroot] [PATCH] libsepol: really fix static library build
In-Reply-To: <1392932556-26763-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 20 Feb 2014 22:42:36 +0100")
References: <1392932556-26763-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txbtwiya.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit 52eeb04c7608b9675bd8c2d57d3a4d1373ee72ad ('libsepol: fix
 > static-only library build') I forgot to git add the changes made to
 > the libsepol.mk file itself. Those changes are needed to actually pass
 > STATIC=<something> when building static libraries only.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
