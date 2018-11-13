From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 09:16:32 +0100
Subject: [Buildroot] [PATCH] libnspr: fix nios2 and microblaze support
 patches
In-Reply-To: <5e84d7a9d569bbcaf66e3a8b0c947f1cda075d2f.1542094988.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 13 Nov 2018 09:43:08 +0200")
References: <5e84d7a9d569bbcaf66e3a8b0c947f1cda075d2f.1542094988.git.baruch@tkos.co.il>
Message-ID: <87k1lh4ckf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit c9e3d5b6c57 (libnspr: bump to version 4.20) did not refresh the
 > hunks touching the _linux.cfg file. As a result, these hunk were applied
 > to the wrong (x86 specific) place in that file, rendering them
 > ineffective. Refresh the patches to fix that.

 > Fixes:
 > http://autobuild.buildroot.net/results/2d1/2d1288e98a6459d84c2599c99b5617a2fde81f62/

 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
