From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:36:34 +0100
Subject: [Buildroot] [PATCH] erlang: use libatomic_ops if available
In-Reply-To: <1418678961-24499-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Mon, 15 Dec 2014 16:29:21 -0500")
References: <1418678961-24499-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87zjaok331.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Erlang can either provide its own atomic_ops implementation or use the
 > one in libatomic_ops. This patch ensures that it only uses the one from
 > libatomic_ops if it is available.

 > Fixes:

 > http://autobuild.buildroot.net/results/3eb/3ebfd36948d5a642cc83ce31ddf5902cb369bfbd/
 > http://autobuild.buildroot.net/results/04c/04cbf79ccf159e15f9ea3953b425faadafc8a1c0/
 > http://autobuild.buildroot.net/results/fc9/fc9904446553e67dd44954310fea26d751a0df5d/
 > http://autobuild.buildroot.net/results/501/501a12da25615071fb6197a898456cfe41a6451d/
 > http://autobuild.buildroot.net/results/34e/34e2fbb4d39737fd7defa5bd607726d52ef38568/
 > http://autobuild.buildroot.net/results/722/7220c3905ebe9e081f1e3b90641b0859d996c2ac/
 > http://autobuild.buildroot.net/results/ffd/ffdc531d8cf9adb43340d045aa88eb0b39fc9bb7/
 > http://autobuild.buildroot.net/results/b4f/b4f238bcb30b0191ce1a2be669fa792c8ccd3e69/

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
