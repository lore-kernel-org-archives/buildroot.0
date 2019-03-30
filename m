From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Mar 2019 20:55:34 +0100
Subject: [Buildroot] [PATCH] package/buysbox: fix build with individual
 binaries
In-Reply-To: <20190330084641.9269-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 30 Mar 2019 09:46:41 +0100")
References: <20190330084641.9269-1-yann.morin.1998@free.fr>
Message-ID: <87sgv4i1c9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fixes:
 >     http://autobuild.buildroot.org/results/053/0539b3765eaa99029c4185ae89db6adb9e867078/

 > Kudos to Thomas for pinpointing the actual issue.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

 > ---
 > Peter, this is a candidate for 2019.02.x.

Sure? This issue afaik got introduced by the bump to 1.30.1.

-- 
Bye, Peter Korsgaard
