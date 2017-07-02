From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 17:57:56 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-external: skip ld-musl
	symlink on static build
In-Reply-To: <3d0e4832c2a187a5bd63ac094c11e2b237661cd5.1498586236.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 27 Jun 2017 20:57:15 +0300")
References: <3d0e4832c2a187a5bd63ac094c11e2b237661cd5.1498586236.git.baruch@tkos.co.il>
Message-ID: <87k23qal17.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Static build with external musl toolchain leaves a dangling symlink to
 > libc.so. Don't create that symlink on static build.

 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
