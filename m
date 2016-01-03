From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 22:05:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: add patch to fix
	libquadmath issue
In-Reply-To: <1451733095-26811-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Sat, 2 Jan 2016 12:11:35
 +0100")
References: <1451733095-26811-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <87poximl0e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Backport patch from upstream [1] to fix build issues with toolchains not
 > providing libquadmath, but still supporting __float128.

 > Fixes:
 > http://autobuild.buildroot.net/results/fcc/fccb40e7b05b84275cfe36a890cedbbaaaa4f953/
 > http://autobuild.buildroot.net/results/cfc/cfcc6c44d2225b9baf0fd92d3cfba4922bfb248b/
 > http://autobuild.buildroot.net/results/ab1/ab1a5aceedb7f9edcd5536b601f1ffb66c5fe1e8/
 > http://autobuild.buildroot.net/results/1ed/1ed3c1ae1e31325b49dd05c1f616637bb5e6382d/
 > http://autobuild.buildroot.net/results/9e5/9e53a5aff9966c6f26e705c91d13692107452feb/
 > and many more.

 > Backported from: 74ff2db959c5fa75bec770c41ed2951a740fe936

 > [1]
 > https://github.com/boostorg/math/commit/74ff2db959c5fa75bec770c41ed2951a740fe936

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
