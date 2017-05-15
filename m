From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:10:49 +0200
Subject: [Buildroot] [git commit] openblas: SPARC support is for Sparc v9
In-Reply-To: <20170513141121.921D582867@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 13 May 2017 16:09:53 +0200")
References: <20170513141121.921D582867@busybox.osuosl.org>
Message-ID: <877f1iialy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6714d79a22b4c0ad7651659c8009f93574bbd59d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Makefile.sparc in the openblas source code passes -mcpu=v9, i.e it
 > assumes a SPARCv9 CPU. Therefore, this commit adjusts openblas
 > Config.in file so that SPARC is only used for BR2_sparc_v9.

 > Fixes:

 >   http://autobuild.buildroot.net/results/805087e87b8bb7d11adb49d9eca3959a37aca3a2/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
