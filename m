From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:12:23 +0200
Subject: [Buildroot] [PATCH][2017.08.x] Update github hashes
In-Reply-To: <20171010091240.7611-1-gary.bisson@boundarydevices.com> (Gary
 Bisson's message of "Tue, 10 Oct 2017 11:12:40 +0200")
References: <20171010091240.7611-1-gary.bisson@boundarydevices.com>
Message-ID: <87h8uygmtk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Based on Bernd patch (commit 4fbc0c9b) which is available on master
 > branch.

 > The kernel-module-imx-gpu-viv and rpi-userland packages are actually
 > broken on 2017.08 so this is a partial backport Bernd patch.

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 > ---
 > Hi all,

 > Sorry to come back again about this issue but would it be possible to
 > create a 2017.08.x branch with this patch? I don't necessarily need a
 > 2017.08.1 tag but at least a branch that builds.

 > The reason is that I made a blog post about the latest features of
 > Buildroot[1]. Since then, the Github hashes changed and many customers
 > complain that my build instructions don't work.

 > Hope that creating such branch would be possible.

Committed to 2017.08.x, thanks and sorry for the delay. I'll release
2017.08.1 later this week.

-- 
Bye, Peter Korsgaard
