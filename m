From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Apr 2018 23:32:35 +0200
Subject: [Buildroot] [PATCH 2/2] keepalived: add patch to disable PIE
In-Reply-To: <20180404204246.30442-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 4 Apr 2018 22:42:46 +0200")
References: <20180404204246.30442-1-thomas.petazzoni@bootlin.com>
 <20180404204246.30442-2-thomas.petazzoni@bootlin.com>
Message-ID: <87lge1l4p8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > PIE breaks the build on m68k and Microblaze, so let's add a patch that
 > disables using PIE by default in keepalived. Obviously, when we start
 > seriously testing the BR2_RELRO_FULL option, we will realize that it
 > is broken on some architectures, and will probably disable it on m68k
 > and Microblaze.

 > Fixes:

 >   http://autobuild.buildroot.net/results/a536f5947b3b70fdaecad1af5542572c504ad046/
 >   http://autobuild.buildroot.net/results/0ffbf1e8d181c9463847a5b2be6f9baa18face24/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
