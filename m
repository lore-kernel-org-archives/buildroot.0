From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:20:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] dieharder: fix link issue with
	inline function not declared static
In-Reply-To: <1500901174-12582-1-git-send-email-julien@vdg.name> (Julien Viard
 de Galbert's message of "Mon, 24 Jul 2017 14:59:34 +0200")
References: <1500901174-12582-1-git-send-email-julien@vdg.name>
Message-ID: <87k22ww43p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Viard de Galbert <julien@vdg.name> writes:

 > Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
 > ---
 > Changes V1 -> V2
 >  - Clarified the reason for the patch c99 std for inline + gcc7
 >  - Since 2017-06-23 ? received the following reports all with the same failure:
 > http://autobuild.buildroot.net/results/b629754c6a820446ff38df8202ea1ed0041bc4ac
 > http://autobuild.buildroot.net/results/e02325e06866618d9d3ee90600dc3326465c56a1
 > http://autobuild.buildroot.net/results/c1db73dcb25ea1db4be0f9d6ce2bf2d02f5bd5bb
 > http://autobuild.buildroot.net/results/bd93120ee7cbfeb4fe7cbcd7f845f131743caf05
 > http://autobuild.buildroot.net/results/273ba504de31bc17fd41e91ee5d6c0b34797a4f9
 > http://autobuild.buildroot.net/results/37920b26f9c4853a0d620eb4a33b50b53e548888
 > http://autobuild.buildroot.net/results/ee668405ed234fbbd644a01d49e8d9d41d216cf6
 > http://autobuild.buildroot.net/results/5b76d62ad03d0cbe483792b32ea14ce7d7432983
 > http://autobuild.buildroot.net/results/cf08d42be8fcb659d59288e2cedf3f18b660e8a6
 > http://autobuild.buildroot.net/results/e1309fd2eea5daf854f4314b92ec441092239cd5

Committed to 2017.05.x (not in 2017.02.x), thanks.

-- 
Bye, Peter Korsgaard
