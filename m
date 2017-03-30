From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:08:11 +0200
Subject: [Buildroot] [git commit] acl: make sure build picks up
	TARGET_CFLAGS
In-Reply-To: <20170318131148.A0068806B5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 18 Mar 2017 14:09:32 +0100")
References: <20170318131148.A0068806B5@busybox.osuosl.org>
Message-ID: <87wpb62zas.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=99c9b0affde4fcc3270425319b98a0e5e32f5964
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The acl build system doesn't use automake, therefore it is broken. It
 > doesn't use the CFLAGS passed by configure. Work around this by passing
 > CFLAGS in the environment. The makefiles append to CFLAGS, so this
 > works.

 > This issue hasn't led to build failures, but it is visible e.g. when
 > stack protector is enabled: the stack protector options are not applied
 > to acl. Also debug and optimisation options aren't applied.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
