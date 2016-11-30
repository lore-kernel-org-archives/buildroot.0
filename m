From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 22:44:39 +0100
Subject: [Buildroot] [PATCH] board/armadeus: bump apf28 kernel version
	to 4.4.30 (latest LTS)
In-Reply-To: <1478534284-5585-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Mon, 7 Nov 2016 16:58:04 +0100")
References: <1478534284-5585-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87polcabi0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 > From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
 > Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>

What about apf9328_defconfig? I believe the gcc 5.x build issues are
fixable by bumping the kernel to 3.18+. See patch 3 here:

https://git.buildroot.net/buildroot/commit/?id=e920e521ac012e5f40720290341d8abceb41a6a6

Can you verify and send a patch? Thanks

-- 
Bye, Peter Korsgaard
