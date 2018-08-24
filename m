From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:38:10 +0200
Subject: [Buildroot] [git commit] libselinux: add patch to fix build
 with gcc < 4.7
In-Reply-To: <20180816093602.672DB86357@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 16 Aug 2018 11:42:50 +0200")
References: <20180816093602.672DB86357@busybox.osuosl.org>
Message-ID: <87pny8jh1p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6288409642d8368104f916bd264d2cb042942dfa
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This commit adds a patch from Hollis Blanchard on libselinux to fix
 > build on host machines that have gcc < 4.7.

 > Fixes:

 >   http://autobuild.buildroot.net/results/a82bb0c0b22ff24263ad7a7d165b21c0df7b3b1d/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
