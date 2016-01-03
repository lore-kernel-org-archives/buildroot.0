From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 21:51:20 +0100
Subject: [Buildroot] [PATCH] package/tremor: select libogg package
In-Reply-To: <1451745735-5358-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Sat, 2 Jan 2016 15:42:15 +0100")
References: <1451745735-5358-1-git-send-email-romain.naour@gmail.com>
Message-ID: <877fjqo08n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > tremor depends on libogg package but doesn't select it
 > in Config.in. so libogg build is trigged at Makefile level.

 > Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
 > stop if a package build is trigged at Makefile level without
 > being selected at Config.in level.

 > Fixes:
 > http://autobuild.buildroot.net/results/0da/0da3265f0f1e499f5d34ed32b0d13a2eda53f976

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
