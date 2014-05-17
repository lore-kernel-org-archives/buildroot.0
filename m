From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 11:34:54 +0200
Subject: [Buildroot] [PATCH] jack2: requires MMU support
In-Reply-To: <1400315404-29308-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 May 2014 10:30:04 +0200")
References: <1400315404-29308-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761l4px35.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > jack2 uses fork(), so it's not available on non-MMU architectures.
 > Fixes:

 >   http://autobuild.buildroot.org/results/0d4/0d441bf1831b2a657b466e44c29423c45c07decd/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
