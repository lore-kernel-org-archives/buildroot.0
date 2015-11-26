From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 21:18:37 +0100
Subject: [Buildroot] [PATCH] quagga: fix static linking
In-Reply-To: <1448551499-24162-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 26 Nov 2015 16:24:59 +0100")
References: <1448551499-24162-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878u5kwm3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to quagga's configure.ac to fix a library
 > ordering problem that is causing a build failure in static linking
 > scenario.

 > Fixes:

 >   http://autobuild.buildroot.org/results/c08/c086f3128232af70d24fd5faf9282ce91d6488ef/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
