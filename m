From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Aug 2014 09:12:02 +0200
Subject: [Buildroot] [PATCH 1/2] nftables: fix build in static scenarios
In-Reply-To: <1408196148-15128-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 Aug 2014 15:35:47 +0200")
References: <1408196148-15128-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761hrzj25.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When linking against readline, it forgets to link against ncurses,
 > which is needed by readline. Fix this by passing LIBS="-lcurses" to
 > the configure script.

 > Fixes:

 >   http://autobuild.buildroot.org/results/98b/98b707ffdeeb1cda94b7c1019ef29cf5fd7db8bf/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
